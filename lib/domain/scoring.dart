/// Deterministic scoring per SCORING_SPEC.md. Pure Dart, no presentation code.
library;

import 'models.dart';

class IncompleteAssessmentException implements Exception {
  IncompleteAssessmentException(this.questionId);
  final String questionId;
  @override
  String toString() => 'Missing required response: $questionId';
}

class InvalidResponseException implements Exception {
  InvalidResponseException(this.questionId, this.value);
  final String questionId;
  final String value;
  @override
  String toString() => 'Invalid response "$value" for $questionId';
}

class UnknownQuestionException implements Exception {
  UnknownQuestionException(this.questionId);
  final String questionId;
  @override
  String toString() => 'Unknown question $questionId';
}

/// Interpretation bands (display labels only, never diagnostic).
enum InterpretationBand {
  developing,
  emerging,
  growing,
  strong;

  /// Bands use the rounded integer that the user sees, so the label and the
  /// displayed number never disagree at a boundary (e.g. 39.6 shows as 40).
  static InterpretationBand fromIndex(double index) {
    final shown = index.round();
    if (shown < 40) return InterpretationBand.developing;
    if (shown < 60) return InterpretationBand.emerging;
    if (shown < 80) return InterpretationBand.growing;
    return InterpretationBand.strong;
  }
}

class DimensionScore {
  const DimensionScore({
    required this.dimension,
    required this.selfReportNorm,
    required this.situationalNorm,
    required this.index,
  });

  final Dimension dimension;
  final double selfReportNorm;
  final double situationalNorm;

  /// Full precision. Round only for display.
  final double index;

  InterpretationBand get band => InterpretationBand.fromIndex(index);
}

class AssessmentScore {
  const AssessmentScore({
    required this.overallIndex,
    required this.dimensions,
    required this.contentVersion,
    required this.scoringVersion,
  });

  final double overallIndex;
  final Map<Dimension, DimensionScore> dimensions;
  final String contentVersion;
  final String scoringVersion;

  InterpretationBand get overallBand =>
      InterpretationBand.fromIndex(overallIndex);
}

class ScoringEngine {
  const ScoringEngine(this.content);

  final ContentBundle content;

  /// Scores a completed assessment. Throws instead of returning partial data.
  /// [answers] maps question ID to raw response text: "1".."5" for
  /// self-report items, the option label ("A".."D") for situational items.
  AssessmentScore score(AssessmentType type, Map<String, String> answers) {
    final questions = content.questionsFor(type);
    final ids = questions.map((q) => q.id).toSet();
    for (final id in answers.keys) {
      if (!ids.contains(id) && content.questionById(id) == null) {
        throw UnknownQuestionException(id);
      }
    }

    final dimensions = <Dimension, DimensionScore>{};
    for (final dim in Dimension.values) {
      dimensions[dim] = _scoreDimension(
        dim,
        questions.where((q) => q.dimension == dim).toList(),
        answers,
      );
    }

    final overall = dimensions.values
            .fold<double>(0, (sum, d) => sum + d.index) /
        dimensions.length;

    return AssessmentScore(
      overallIndex: overall,
      dimensions: dimensions,
      contentVersion: content.contentVersion,
      scoringVersion: content.scoringVersion,
    );
  }

  DimensionScore _scoreDimension(
    Dimension dim,
    List<Question> items,
    Map<String, String> answers,
  ) {
    final selfValues = <double>[];
    final situationalValues = <double>[];

    for (final item in items) {
      final raw = answers[item.id];
      if (raw == null) throw IncompleteAssessmentException(item.id);
      if (!item.isValidResponse(raw)) {
        throw InvalidResponseException(item.id, raw);
      }
      switch (item.type) {
        case ItemType.selfReport:
          var value = int.parse(raw);
          if (item.reverseScored) value = 6 - value;
          selfValues.add(value.toDouble());
        case ItemType.situational:
          situationalValues.add(item.optionFor(raw)!.score.toDouble());
      }
    }

    if (selfValues.isEmpty || situationalValues.isEmpty) {
      throw StateError('Dimension ${dim.code} lacks one item type');
    }

    final selfNorm = ((_mean(selfValues) - 1) / 4) * 100;
    final situationalNorm = ((_mean(situationalValues) - 1) / 3) * 100;

    return DimensionScore(
      dimension: dim,
      selfReportNorm: selfNorm,
      situationalNorm: situationalNorm,
      index: 0.5 * selfNorm + 0.5 * situationalNorm,
    );
  }

  double _mean(List<double> values) =>
      values.fold<double>(0, (a, b) => a + b) / values.length;
}
