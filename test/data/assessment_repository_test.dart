import 'package:drift/native.dart';
import 'package:eq_test/data/db/app_database.dart';
import 'package:eq_test/data/repositories/assessment_repository.dart';
import 'package:eq_test/domain/models.dart';
import 'package:eq_test/domain/scoring.dart';
import 'package:flutter_test/flutter_test.dart';

import '../domain/test_support.dart';

void main() {
  late AppDatabase db;
  late AssessmentRepository repo;
  final content = loadContent();

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    repo = AssessmentRepository(
      db: db,
      engine: ScoringEngine(content),
      contentVersion: content.contentVersion,
      scoringVersion: content.scoringVersion,
    );
  });

  tearDown(() async => db.close());

  Future<void> answerAll(String sessionId, AssessmentType type) async {
    final answers = buildAnswers(
      content,
      type,
      selfRaw: (_) => '4',
      situationalLabel: bestOption,
    );
    var i = 0;
    for (final entry in answers.entries) {
      await repo.saveAnswer(
        sessionId: sessionId,
        questionId: entry.key,
        value: entry.value,
        currentIndex: i++,
      );
    }
  }

  test('starting a quick test creates one in-progress session', () async {
    final s = await repo.startOrResume(AssessmentType.quick, 'en');
    expect(s.answeredCount, 0);
    expect(s.currentIndex, 0);
  });

  test('progress is resumed with the same session and saved position', () async {
    final first = await repo.startOrResume(AssessmentType.quick, 'en');
    await repo.saveAnswer(
      sessionId: first.sessionId,
      questionId: 'Q-SA-01',
      value: '5',
      currentIndex: 3,
    );

    final resumed = await repo.startOrResume(AssessmentType.quick, 'en');
    expect(resumed.sessionId, first.sessionId);
    expect(resumed.currentIndex, 3);
    expect(resumed.answeredCount, 1);
  });

  test('incomplete submission throws and writes no result', () async {
    final s = await repo.startOrResume(AssessmentType.quick, 'en');
    await repo.saveAnswer(
      sessionId: s.sessionId,
      questionId: 'Q-SA-01',
      value: '5',
      currentIndex: 0,
    );

    await expectLater(
      repo.complete(sessionId: s.sessionId, type: AssessmentType.quick),
      throwsA(isA<IncompleteAssessmentException>()),
    );
    expect(await repo.getResult(s.sessionId), isNull);
  });

  test('completing stores an immutable result and appears in history', () async {
    final s = await repo.startOrResume(AssessmentType.quick, 'en');
    await answerAll(s.sessionId, AssessmentType.quick);

    final score = await repo.complete(
      sessionId: s.sessionId,
      type: AssessmentType.quick,
    );

    final stored = await repo.getResult(s.sessionId);
    expect(stored, isNotNull);
    expect(stored!.overallIndex, closeTo(score.overallIndex, 1e-9));
    expect(stored.contentVersion, content.contentVersion);
    expect(stored.scoringVersion, content.scoringVersion);
    expect(stored.dimensions.length, 4);
    expect(
      stored.dimensions[Dimension.selfAwareness]!.index,
      closeTo(score.dimensions[Dimension.selfAwareness]!.index, 1e-9),
    );

    final history = await repo.watchHistory().first;
    expect(history.map((e) => e.sessionId), [s.sessionId]);

    // A completed session no longer resumes; a new attempt starts fresh.
    final next = await repo.startOrResume(AssessmentType.quick, 'en');
    expect(next.sessionId, isNot(s.sessionId));
  });

  test('abandoning removes partial answers and the session', () async {
    final s = await repo.startOrResume(AssessmentType.full, 'vi');
    await repo.saveAnswer(
      sessionId: s.sessionId,
      questionId: 'Q-SA-01',
      value: '2',
      currentIndex: 0,
    );
    await repo.abandon(s.sessionId);
    expect(await repo.getInProgress(s.sessionId), isNull);
    expect(await repo.loadAnswers(s.sessionId), isEmpty);
  });

  test('plan progress can be marked and unmarked', () async {
    final s = await repo.startOrResume(AssessmentType.full, 'en');
    await repo.setPlanDayCompleted(s.sessionId, 2, true);
    await repo.setPlanDayCompleted(s.sessionId, 5, true);
    await repo.setPlanDayCompleted(s.sessionId, 2, false);
    final days = await repo.watchCompletedPlanDays(s.sessionId).first;
    expect(days, {5});
  });

  test('delete all removes every assessment record', () async {
    final s = await repo.startOrResume(AssessmentType.quick, 'en');
    await answerAll(s.sessionId, AssessmentType.quick);
    await repo.complete(sessionId: s.sessionId, type: AssessmentType.quick);
    await repo.setPlanDayCompleted(s.sessionId, 1, true);

    await repo.deleteAllData();

    expect(await repo.watchHistory().first, isEmpty);
    expect(await repo.getResult(s.sessionId), isNull);
    expect(await repo.watchCompletedPlanDays(s.sessionId).first, isEmpty);
  });
}
