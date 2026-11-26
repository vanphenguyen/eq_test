import 'package:eq_test/domain/models.dart';
import 'package:eq_test/domain/scoring.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_support.dart';

void main() {
  final content = loadContent();
  final engine = ScoringEngine(content);

  group('content composition', () {
    test('quick has 12 items, full has 40, all IDs unique', () {
      final quick = content.questionsFor(AssessmentType.quick);
      final full = content.questionsFor(AssessmentType.full);
      expect(quick.length, 12);
      expect(full.length, 40);
      expect(full.map((q) => q.id).toSet().length, 40);
    });

    test('full assessment contains every quick item', () {
      final fullIds =
          content.questionsFor(AssessmentType.full).map((q) => q.id).toSet();
      for (final q in content.questionsFor(AssessmentType.quick)) {
        expect(fullIds, contains(q.id));
      }
    });

    test('reverse scoring only on self-report items', () {
      for (final q in content.questionsFor(AssessmentType.full)) {
        if (q.type == ItemType.situational) {
          expect(q.reverseScored, isFalse, reason: q.id);
        }
      }
    });

    test('situational options use keyed scores 1-4 with 4 options each', () {
      for (final q in content.questionsFor(AssessmentType.full)) {
        if (q.type != ItemType.situational) continue;
        expect(q.options.length, 4, reason: q.id);
        for (final o in q.options) {
          expect(o.score, inInclusiveRange(1, 4), reason: q.id);
        }
        expect(q.options.map((o) => o.score).toSet().length, 4,
            reason: '${q.id} should key each option distinctly');
      }
    });
  });

  group('SCORING_SPEC worked example', () {
    test('Self-Awareness quick example yields 87.5 (displays 88)', () {
      // Q-SA-01 raw 4 (normal) -> 4; Q-SA-02 raw 2 (reverse) -> 4;
      // Q-SA-03 option C -> keyed 4.
      final answers = buildAnswers(
        content,
        AssessmentType.quick,
        selfRaw: (q) => '3',
        situationalLabel: (q) => 'A',
      );
      answers['Q-SA-01'] = '4';
      answers['Q-SA-02'] = '2';
      answers['Q-SA-03'] = 'C';

      final score = engine.score(AssessmentType.quick, answers);
      final sa = score.dimensions[Dimension.selfAwareness]!;

      expect(sa.selfReportNorm, closeTo(75, 1e-9));
      expect(sa.situationalNorm, closeTo(100, 1e-9));
      expect(sa.index, closeTo(87.5, 1e-9));
      expect(sa.index.round(), 88);
    });
  });

  group('boundary vectors', () {
    test('all lowest responses produce 0 for every dimension', () {
      final answers = buildAnswers(
        content,
        AssessmentType.full,
        selfRaw: minSelfRaw,
        situationalLabel: worstOption,
      );
      final score = engine.score(AssessmentType.full, answers);
      for (final d in score.dimensions.values) {
        expect(d.index, closeTo(0, 1e-9), reason: d.dimension.code);
      }
      expect(score.overallIndex, closeTo(0, 1e-9));
    });

    test('all highest responses produce 100 for every dimension', () {
      final answers = buildAnswers(
        content,
        AssessmentType.full,
        selfRaw: maxSelfRaw,
        situationalLabel: bestOption,
      );
      final score = engine.score(AssessmentType.full, answers);
      for (final d in score.dimensions.values) {
        expect(d.index, closeTo(100, 1e-9), reason: d.dimension.code);
      }
      expect(score.overallIndex, closeTo(100, 1e-9));
    });

    test('reverse item raw 1 adjusts to 5 and raw 5 adjusts to 1', () {
      final reversed = content.questionById('Q-SA-02')!;
      expect(reversed.reverseScored, isTrue);

      Map<String, String> answersWith(String raw) {
        final a = buildAnswers(
          content,
          AssessmentType.quick,
          selfRaw: (q) => '3',
          situationalLabel: (q) => 'A',
        );
        a['Q-SA-02'] = raw;
        return a;
      }

      // raw 1 -> adjusted 5 -> norm 100 for self-report part of SA.
      final high = engine
          .score(AssessmentType.quick, answersWith('1'))
          .dimensions[Dimension.selfAwareness]!;
      // raw 5 -> adjusted 1 -> norm 0.
      final low = engine
          .score(AssessmentType.quick, answersWith('5'))
          .dimensions[Dimension.selfAwareness]!;

      // Q-SA-01 is 3 (norm 50) with Q-SA-02 adjusted: mean(3,5)=4 -> 75.
      expect(high.selfReportNorm, closeTo(75, 1e-9));
      // mean(3,1)=2 -> 25.
      expect(low.selfReportNorm, closeTo(25, 1e-9));
    });

    test('situational option maps to its keyed score, not its position', () {
      final q = content.questionById('Q-SR-03')!;
      // Option A is listed first but keyed 4; option D is last, keyed 1.
      final a = buildAnswers(
        content,
        AssessmentType.quick,
        selfRaw: (_) => '3',
        situationalLabel: (_) => 'A',
      )..[q.id] = 'D';
      final sr = engine
          .score(AssessmentType.quick, a)
          .dimensions[Dimension.selfRegulation]!;
      // keyed 1 -> ((1-1)/3)*100 = 0
      expect(sr.situationalNorm, closeTo(0, 1e-9));
    });
  });

  group('validation', () {
    test('missing required answer rejects scoring', () {
      final answers = buildAnswers(
        content,
        AssessmentType.quick,
        selfRaw: (_) => '3',
        situationalLabel: (_) => 'A',
      )..remove('Q-RM-02');
      expect(
        () => engine.score(AssessmentType.quick, answers),
        throwsA(isA<IncompleteAssessmentException>()),
      );
    });

    test('unknown question ID rejects scoring', () {
      final answers = buildAnswers(
        content,
        AssessmentType.quick,
        selfRaw: (_) => '3',
        situationalLabel: (_) => 'A',
      )..['Q-XX-99'] = '3';
      expect(
        () => engine.score(AssessmentType.quick, answers),
        throwsA(isA<UnknownQuestionException>()),
      );
    });

    test('Likert value outside 1-5 rejects scoring', () {
      final answers = buildAnswers(
        content,
        AssessmentType.quick,
        selfRaw: (_) => '3',
        situationalLabel: (_) => 'A',
      )..['Q-SA-01'] = '6';
      expect(
        () => engine.score(AssessmentType.quick, answers),
        throwsA(isA<InvalidResponseException>()),
      );
    });

    test('invalid situational option rejects scoring', () {
      final answers = buildAnswers(
        content,
        AssessmentType.quick,
        selfRaw: (_) => '3',
        situationalLabel: (_) => 'A',
      )..['Q-SA-03'] = 'E';
      expect(
        () => engine.score(AssessmentType.quick, answers),
        throwsA(isA<InvalidResponseException>()),
      );
    });
  });

  group('overall index and bands', () {
    test('overall equals arithmetic mean of four dimension indices', () {
      final answers = buildAnswers(
        content,
        AssessmentType.full,
        selfRaw: (q) => q.id.hashCode.isEven ? '4' : '2',
        situationalLabel: (q) => q.options.last.label,
      );
      final score = engine.score(AssessmentType.full, answers);
      final mean = score.dimensions.values
              .map((d) => d.index)
              .reduce((a, b) => a + b) /
          4;
      expect(score.overallIndex, closeTo(mean, 1e-12));
    });

    test('scoring is deterministic for identical inputs', () {
      final answers = buildAnswers(
        content,
        AssessmentType.full,
        selfRaw: (q) => '3',
        situationalLabel: (q) => 'B',
      );
      final a = engine.score(AssessmentType.full, answers).overallIndex;
      final b = engine.score(AssessmentType.full, answers).overallIndex;
      expect(a, b);
    });

    test('band boundaries: 39 developing, 40 emerging, 59 emerging, 60 growing, 79 growing, 80 strong', () {
      expect(InterpretationBand.fromIndex(39), InterpretationBand.developing);
      expect(InterpretationBand.fromIndex(40), InterpretationBand.emerging);
      expect(InterpretationBand.fromIndex(59), InterpretationBand.emerging);
      expect(InterpretationBand.fromIndex(60), InterpretationBand.growing);
      expect(InterpretationBand.fromIndex(79), InterpretationBand.growing);
      expect(InterpretationBand.fromIndex(80), InterpretationBand.strong);
    });

    test('band follows the displayed integer (39.6 shows 40, so Emerging)', () {
      expect(InterpretationBand.fromIndex(39.6), InterpretationBand.emerging);
      expect(InterpretationBand.fromIndex(39.4), InterpretationBand.developing);
    });

    test('stored score keeps full precision', () {
      final answers = buildAnswers(
        content,
        AssessmentType.quick,
        selfRaw: (_) => '3',
        situationalLabel: (_) => 'A',
      )..['Q-SA-01'] = '4';
      final score = engine.score(AssessmentType.quick, answers);
      final sa = score.dimensions[Dimension.selfAwareness]!.index;
      expect(sa, isNot(sa.roundToDouble()));
    });
  });
}
