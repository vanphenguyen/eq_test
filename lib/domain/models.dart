/// Pure domain models. No Flutter or storage imports in this file.
library;

enum AssessmentType {
  quick('quick'),
  full('full');

  const AssessmentType(this.code);
  final String code;

  static AssessmentType fromCode(String code) =>
      AssessmentType.values.firstWhere(
        (t) => t.code == code,
        orElse: () => throw FormatException('Unknown assessment type: $code'),
      );
}

enum Dimension {
  selfAwareness('SA'),
  selfRegulation('SR'),
  socialAwareness('SO'),
  relationshipManagement('RM');

  const Dimension(this.code);
  final String code;

  static Dimension fromCode(String code) => Dimension.values.firstWhere(
        (d) => d.code == code,
        orElse: () => throw FormatException('Unknown dimension: $code'),
      );
}

enum ItemType { selfReport, situational }

/// Text stored once per locale. Only `en` and `vi` are supported in MVP.
class LocalizedText {
  const LocalizedText({required this.en, required this.vi});

  factory LocalizedText.fromJson(Map<String, dynamic> json) => LocalizedText(
        en: json['en'] as String,
        vi: json['vi'] as String,
      );

  final String en;
  final String vi;

  String resolve(String languageCode) => languageCode == 'vi' ? vi : en;
}

class QuestionOption {
  const QuestionOption({
    required this.label,
    required this.score,
    required this.text,
  });

  factory QuestionOption.fromJson(Map<String, dynamic> json) => QuestionOption(
        label: json['label'] as String,
        score: json['score'] as int,
        text: LocalizedText.fromJson(json['text'] as Map<String, dynamic>),
      );

  final String label;

  /// Keyed reflection score (1-4). Never derived from list position.
  final int score;
  final LocalizedText text;
}

class Question {
  const Question({
    required this.id,
    required this.dimension,
    required this.type,
    required this.prompt,
    required this.inQuick,
    this.reverseScored = false,
    this.options = const [],
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    final type = json['type'] == 'situational'
        ? ItemType.situational
        : ItemType.selfReport;
    return Question(
      id: json['id'] as String,
      dimension: Dimension.fromCode(json['dimension'] as String),
      type: type,
      prompt: LocalizedText.fromJson(json['prompt'] as Map<String, dynamic>),
      inQuick: json['inQuick'] as bool,
      reverseScored: (json['reverseScored'] as bool?) ?? false,
      options: ((json['options'] as List<dynamic>?) ?? const [])
          .map((o) => QuestionOption.fromJson(o as Map<String, dynamic>))
          .toList(growable: false),
    );
  }

  final String id;
  final Dimension dimension;
  final ItemType type;
  final LocalizedText prompt;
  final bool inQuick;

  /// Only meaningful for self-report items.
  final bool reverseScored;

  /// Only used by situational items.
  final List<QuestionOption> options;

  /// Self-report: integer 1-5 as text. Situational: option label such as "A".
  bool isValidResponse(String value) {
    switch (type) {
      case ItemType.selfReport:
        final n = int.tryParse(value);
        return n != null && n >= 1 && n <= 5;
      case ItemType.situational:
        return options.any((o) => o.label == value);
    }
  }

  QuestionOption? optionFor(String label) {
    for (final o in options) {
      if (o.label == label) return o;
    }
    return null;
  }
}

/// Versioned content: questions, assessment composition and copy for scale labels.
class ContentBundle {
  ContentBundle({
    required this.contentVersion,
    required this.scoringVersion,
    required this.scaleLabels,
    required this.dimensionNames,
    required this.dimensionDefinitions,
    required this.orders,
    required this._questionsById,
  }) {
    _validate();
  }

  factory ContentBundle.fromJson(Map<String, dynamic> json) {
    final scale = json['scaleLabels'] as Map<String, dynamic>;
    final dims = json['dimensions'] as Map<String, dynamic>;
    final assessments = json['assessments'] as Map<String, dynamic>;
    final questions = (json['questions'] as List<dynamic>)
        .map((q) => Question.fromJson(q as Map<String, dynamic>))
        .toList();
    return ContentBundle(
      contentVersion: json['contentVersion'] as String,
      scoringVersion: json['scoringVersion'] as String,
      scaleLabels: {
        'en': (scale['en'] as List<dynamic>).cast<String>(),
        'vi': (scale['vi'] as List<dynamic>).cast<String>(),
      },
      dimensionNames: {
        for (final e in dims.entries)
          Dimension.fromCode(e.key): LocalizedText.fromJson(
            (e.value as Map<String, dynamic>)['name'] as Map<String, dynamic>,
          ),
      },
      dimensionDefinitions: {
        for (final e in dims.entries)
          Dimension.fromCode(e.key): LocalizedText.fromJson(
            (e.value as Map<String, dynamic>)['definition']
                as Map<String, dynamic>,
          ),
      },
      orders: {
        for (final e in assessments.entries)
          AssessmentType.fromCode(e.key): ((e.value
                      as Map<String, dynamic>)['order'] as List<dynamic>)
                  .cast<String>(),
      },
      questionsById: {for (final q in questions) q.id: q},
    );
  }

  final String contentVersion;
  final String scoringVersion;
  final Map<String, List<String>> scaleLabels;
  final Map<Dimension, LocalizedText> dimensionNames;
  final Map<Dimension, LocalizedText> dimensionDefinitions;
  final Map<AssessmentType, List<String>> orders;
  final Map<String, Question> _questionsById;

  Question? questionById(String id) => _questionsById[id];

  /// Ordered questions for an assessment type. Order is deterministic.
  List<Question> questionsFor(AssessmentType type) => [
        for (final id in orders[type]!) _questionsById[id]!,
      ];

  /// Fails fast on inconsistent content (missing IDs, wrong composition).
  void _validate() {
    for (final entry in orders.entries) {
      for (final id in entry.value) {
        if (!_questionsById.containsKey(id)) {
          throw StateError('Order references unknown question $id');
        }
      }
    }
    final quick = questionsFor(AssessmentType.quick);
    final full = questionsFor(AssessmentType.full);
    if (quick.length != 12 || full.length != 40) {
      throw StateError('Expected 12 quick and 40 full items.');
    }
    for (final dim in Dimension.values) {
      final q = quick.where((x) => x.dimension == dim).toList();
      final f = full.where((x) => x.dimension == dim).toList();
      if (q.length != 3 ||
          q.where((x) => x.type == ItemType.selfReport).length != 2) {
        throw StateError('Quick composition wrong for ${dim.code}');
      }
      if (f.length != 10 ||
          f.where((x) => x.type == ItemType.selfReport).length != 6) {
        throw StateError('Full composition wrong for ${dim.code}');
      }
    }
  }
}
