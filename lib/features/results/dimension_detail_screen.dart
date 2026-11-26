import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';
import '../../domain/models.dart';
import '../../l10n/app_localizations.dart';
import '../common/widgets.dart';

class DimensionDetailScreen extends ConsumerWidget {
  const DimensionDetailScreen({
    super.key,
    required this.sessionId,
    required this.dimension,
  });

  final String sessionId;
  final Dimension dimension;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final locale = localeCodeOf(context);
    final entry = ref.watch(resultEntryProvider(sessionId));
    final content = ref.watch(contentProvider).value;
    final result = ref.watch(resultContentProvider).value;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(dimensionLabel(l, dimension))),
      body: entry.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(child: Text(l.genericError)),
        data: (e) {
          if (e == null || content == null || result == null) {
            return Center(child: Text(l.genericError));
          }
          final score = e.dimensions[dimension]!;
          final band = score.band;
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text(content.dimensionDefinitions[dimension]!.resolve(locale),
                  style: theme.textTheme.bodyLarge),
              const SizedBox(height: 20),
              DimensionBar(
                label: l.dimensionDetailTitle,
                index: score.index,
              ),
              Row(
                children: [
                  Expanded(
                    child: _SubScore(
                      label: l.selfReportSubscore,
                      value: score.selfReportNorm,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _SubScore(
                      label: l.situationalSubscore,
                      value: score.situationalNorm,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Chip(label: Text(bandLabel(l, band))),
              const SizedBox(height: 12),
              Text(result.dimensionBandText[dimension]![band]!.resolve(locale)),
              const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l.practicalSuggestion,
                          style: theme.textTheme.titleSmall),
                      const SizedBox(height: 8),
                      Text(result.dimensionSuggestion[dimension]!
                          .resolve(locale)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ReflectionCaveat(text: l.resultCaveat),
            ],
          );
        },
      ),
    );
  }
}

class _SubScore extends StatelessWidget {
  const _SubScore({required this.label, required this.value});
  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(label, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: 4),
            Text('${value.round()}',
                style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
