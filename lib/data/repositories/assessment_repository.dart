import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../domain/models.dart';
import '../../domain/scoring.dart';
import '../db/app_database.dart';

/// A finished assessment as shown in history.
class HistoryEntry {
  const HistoryEntry({
    required this.sessionId,
    required this.type,
    required this.completedAt,
    required this.overallIndex,
    required this.dimensions,
    required this.contentVersion,
    required this.scoringVersion,
  });

  final String sessionId;
  final AssessmentType type;
  final DateTime completedAt;
  final double overallIndex;
  final Map<Dimension, DimensionScore> dimensions;
  final String contentVersion;
  final String scoringVersion;

  InterpretationBand get band => InterpretationBand.fromIndex(overallIndex);
}

class InProgressSession {
  const InProgressSession({
    required this.sessionId,
    required this.type,
    required this.currentIndex,
    required this.answeredCount,
  });

  final String sessionId;
  final AssessmentType type;
  final int currentIndex;
  final int answeredCount;
}

class AssessmentRepository {
  AssessmentRepository({
    required this.db,
    required this.engine,
    required this.contentVersion,
    required this.scoringVersion,
  });

  final AppDatabase db;
  final ScoringEngine engine;
  final String contentVersion;
  final String scoringVersion;

  static const _uuid = Uuid();

  /// Resumes the newest in-progress session of [type], or creates one.
  Future<InProgressSession> startOrResume(
    AssessmentType type,
    String locale,
  ) async {
    final existing = await (db.select(db.assessmentSessions)
          ..where((s) =>
              s.assessmentType.equals(type.code) &
              s.status.equals('in_progress'))
          ..orderBy([(s) => OrderingTerm.desc(s.updatedAt)])
          ..limit(1))
        .getSingleOrNull();

    if (existing != null) {
      final answers = await loadAnswers(existing.id);
      return InProgressSession(
        sessionId: existing.id,
        type: type,
        currentIndex: existing.currentIndex,
        answeredCount: answers.length,
      );
    }

    final now = DateTime.now();
    final id = _uuid.v4();
    await db.into(db.assessmentSessions).insert(
          AssessmentSessionsCompanion.insert(
            id: id,
            assessmentType: type.code,
            status: 'in_progress',
            contentVersion: contentVersion,
            scoringVersion: scoringVersion,
            localeAtStart: locale,
            startedAt: now,
            updatedAt: now,
          ),
        );
    return InProgressSession(
      sessionId: id,
      type: type,
      currentIndex: 0,
      answeredCount: 0,
    );
  }

  /// Saved position and answers for a session that is still in progress.
  Future<InProgressSession?> getInProgress(String sessionId) async {
    final row = await (db.select(db.assessmentSessions)
          ..where((s) => s.id.equals(sessionId) & s.status.equals('in_progress')))
        .getSingleOrNull();
    if (row == null) return null;
    final answers = await loadAnswers(sessionId);
    return InProgressSession(
      sessionId: row.id,
      type: AssessmentType.fromCode(row.assessmentType),
      currentIndex: row.currentIndex,
      answeredCount: answers.length,
    );
  }

  Future<Map<String, String>> loadAnswers(String sessionId) async {
    final rows = await (db.select(db.answers)
          ..where((a) => a.sessionId.equals(sessionId)))
        .get();
    return {for (final r in rows) r.questionId: r.selectedValue};
  }

  /// Saves one response and the position in a single transaction (NFR-R-001).
  Future<void> saveAnswer({
    required String sessionId,
    required String questionId,
    required String value,
    required int currentIndex,
  }) {
    final now = DateTime.now();
    return db.transaction(() async {
      await db.into(db.answers).insertOnConflictUpdate(
            AnswersCompanion.insert(
              sessionId: sessionId,
              questionId: questionId,
              selectedValue: value,
              answeredAt: now,
            ),
          );
      await setPosition(sessionId, currentIndex);
    });
  }

  /// Position is stored on the session row, not inferred from answers.
  Future<void> setPosition(String sessionId, int index) {
    return (db.update(db.assessmentSessions)
          ..where((s) => s.id.equals(sessionId)))
        .write(
      AssessmentSessionsCompanion(
        currentIndex: Value(index),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  /// Scores and stores a completed assessment. Throws if any response is
  /// missing or invalid, so no partial result is ever written.
  Future<AssessmentScore> complete({
    required String sessionId,
    required AssessmentType type,
  }) async {
    final answers = await loadAnswers(sessionId);
    final score = engine.score(type, answers);
    final now = DateTime.now();

    await db.transaction(() async {
      await db.into(db.results).insert(
            ResultsCompanion.insert(
              sessionId: sessionId,
              overallIndex: score.overallIndex,
              dimensionIndices: jsonEncode({
                for (final e in score.dimensions.entries)
                  e.key.code: {
                    'index': e.value.index,
                    'selfReport': e.value.selfReportNorm,
                    'situational': e.value.situationalNorm,
                  },
              }),
              interpretationBand: score.overallBand.name,
              contentVersion: score.contentVersion,
              scoringVersion: score.scoringVersion,
              createdAt: now,
            ),
          );
      await (db.update(db.assessmentSessions)
            ..where((s) => s.id.equals(sessionId)))
          .write(
        AssessmentSessionsCompanion(
          status: const Value('completed'),
          completedAt: Value(now),
          updatedAt: Value(now),
        ),
      );
    });
    return score;
  }

  /// Abandons a session and removes its partial answers.
  Future<void> abandon(String sessionId) => db.transaction(() async {
        await (db.delete(db.answers)
              ..where((a) => a.sessionId.equals(sessionId)))
            .go();
        await (db.delete(db.assessmentSessions)
              ..where((s) => s.id.equals(sessionId)))
            .go();
      });

  Stream<List<HistoryEntry>> watchHistory() {
    final query = db.select(db.results).join([
      innerJoin(
        db.assessmentSessions,
        db.assessmentSessions.id.equalsExp(db.results.sessionId),
      ),
    ])
      ..orderBy([OrderingTerm.desc(db.results.createdAt)]);

    return query.watch().map((rows) => [
          for (final row in rows)
            _toEntry(
              row.readTable(db.results),
              row.readTable(db.assessmentSessions),
            ),
        ]);
  }

  Future<HistoryEntry?> getResult(String sessionId) async {
    final query = db.select(db.results).join([
      innerJoin(
        db.assessmentSessions,
        db.assessmentSessions.id.equalsExp(db.results.sessionId),
      ),
    ])
      ..where(db.results.sessionId.equals(sessionId));
    final row = await query.getSingleOrNull();
    if (row == null) return null;
    return _toEntry(
      row.readTable(db.results),
      row.readTable(db.assessmentSessions),
    );
  }

  HistoryEntry _toEntry(Result r, AssessmentSession s) {
    final raw = jsonDecode(r.dimensionIndices) as Map<String, dynamic>;
    return HistoryEntry(
      sessionId: r.sessionId,
      type: AssessmentType.fromCode(s.assessmentType),
      completedAt: s.completedAt ?? r.createdAt,
      overallIndex: r.overallIndex,
      dimensions: {
        for (final e in raw.entries)
          Dimension.fromCode(e.key): _dimensionFromJson(
            Dimension.fromCode(e.key),
            e.value as Map<String, dynamic>,
          ),
      },
      contentVersion: r.contentVersion,
      scoringVersion: r.scoringVersion,
    );
  }

  DimensionScore _dimensionFromJson(Dimension d, Map<String, dynamic> j) =>
      DimensionScore(
        dimension: d,
        index: (j['index'] as num).toDouble(),
        selfReportNorm: (j['selfReport'] as num).toDouble(),
        situationalNorm: (j['situational'] as num).toDouble(),
      );

  Stream<Set<int>> watchCompletedPlanDays(String sessionId) {
    return (db.select(db.planProgress)
          ..where((p) => p.sessionId.equals(sessionId) & p.completed.equals(true)))
        .watch()
        .map((rows) => rows.map((r) => r.dayNumber).toSet());
  }

  Future<void> setPlanDayCompleted(
    String sessionId,
    int day,
    bool completed,
  ) {
    return db.into(db.planProgress).insertOnConflictUpdate(
          PlanProgressCompanion.insert(
            sessionId: sessionId,
            dayNumber: day,
            completed: Value(completed),
          ),
        );
  }

  Future<void> deleteAllData() => db.deleteAllAssessmentData();
}
