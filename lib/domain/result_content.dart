/// Authored result copy. Selected by rules, never generated.
library;

import 'models.dart';
import 'scoring.dart';

class PracticeActivity {
  const PracticeActivity({
    required this.day,
    required this.dimension,
    required this.title,
    required this.body,
  });

  factory PracticeActivity.fromJson(Map<String, dynamic> json) =>
      PracticeActivity(
        day: json['day'] as int,
        dimension: Dimension.fromCode(json['dimension'] as String),
        title: LocalizedText.fromJson(json['title'] as Map<String, dynamic>),
        body: LocalizedText.fromJson(json['body'] as Map<String, dynamic>),
      );

  final int day;
  final Dimension dimension;
  final LocalizedText title;
  final LocalizedText body;
}

class ResultContent {
  const ResultContent({
    required this.contentVersion,
    required this.overallBands,
    required this.dimensionBandText,
    required this.dimensionStrengths,
    required this.dimensionGrowth,
    required this.dimensionSuggestion,
    required this.practicePlan,
  });

  factory ResultContent.fromJson(Map<String, dynamic> json) {
    LocalizedText text(Object? v) =>
        LocalizedText.fromJson(v as Map<String, dynamic>);
    Map<Dimension, LocalizedText> byDim(String key) => {
          for (final e
              in (json[key] as Map<String, dynamic>).entries)
            Dimension.fromCode(e.key): text(e.value),
        };

    final bandMap = json['overallBands'] as Map<String, dynamic>;
    final dimBand = json['dimensionBandText'] as Map<String, dynamic>;

    return ResultContent(
      contentVersion: json['contentVersion'] as String,
      overallBands: {
        for (final e in bandMap.entries)
          InterpretationBand.values.byName(e.key): text(e.value),
      },
      dimensionBandText: {
        for (final e in dimBand.entries)
          Dimension.fromCode(e.key): {
            for (final b in (e.value as Map<String, dynamic>).entries)
              InterpretationBand.values.byName(b.key): text(b.value),
          },
      },
      dimensionStrengths: byDim('dimensionStrengths'),
      dimensionGrowth: byDim('dimensionGrowth'),
      dimensionSuggestion: byDim('dimensionSuggestion'),
      practicePlan: (json['practicePlan'] as List<dynamic>)
          .map((p) => PracticeActivity.fromJson(p as Map<String, dynamic>))
          .toList(growable: false),
    );
  }

  final String contentVersion;
  final Map<InterpretationBand, LocalizedText> overallBands;
  final Map<Dimension, Map<InterpretationBand, LocalizedText>>
      dimensionBandText;
  final Map<Dimension, LocalizedText> dimensionStrengths;
  final Map<Dimension, LocalizedText> dimensionGrowth;
  final Map<Dimension, LocalizedText> dimensionSuggestion;
  final List<PracticeActivity> practicePlan;
}
