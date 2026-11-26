import 'package:flutter/material.dart';

import '../../domain/models.dart';
import '../../domain/scoring.dart';
import '../../l10n/app_localizations.dart';

String localeCodeOf(BuildContext context) =>
    Localizations.localeOf(context).languageCode;

String bandLabel(AppLocalizations l, InterpretationBand band) {
  switch (band) {
    case InterpretationBand.developing:
      return l.bandDeveloping;
    case InterpretationBand.emerging:
      return l.bandEmerging;
    case InterpretationBand.growing:
      return l.bandGrowing;
    case InterpretationBand.strong:
      return l.bandStrong;
  }
}

String dimensionLabel(AppLocalizations l, Dimension d) {
  switch (d) {
    case Dimension.selfAwareness:
      return l.dimSelfAwareness;
    case Dimension.selfRegulation:
      return l.dimSelfRegulation;
    case Dimension.socialAwareness:
      return l.dimSocialAwareness;
    case Dimension.relationshipManagement:
      return l.dimRelationshipManagement;
  }
}

/// Visible, non-hidden limitation note (SRS-F-041).
class ReflectionCaveat extends StatelessWidget {
  const ReflectionCaveat({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: scheme.secondaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, size: 20, color: scheme.onSecondaryContainer),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: scheme.onSecondaryContainer,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Dimension row with a textual value. Bars never replace the number.
class DimensionBar extends StatelessWidget {
  const DimensionBar({
    super.key,
    required this.label,
    required this.index,
  });

  final String label;
  final double index;

  @override
  Widget build(BuildContext context) {
    final shown = index.round();
    final theme = Theme.of(context);
    return Semantics(
      label: '$label: $shown out of 100',
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(label, style: theme.textTheme.titleSmall)),
                Text('$shown', style: theme.textTheme.titleSmall),
              ],
            ),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: (index / 100).clamp(0.0, 1.0),
                minHeight: 8,
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Answer option. Selection shows a check icon and border, not color alone.
class ChoiceTile extends StatelessWidget {
  const ChoiceTile({
    super.key,
    required this.label,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String text;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Semantics(
      button: true,
      selected: selected,
      label: text,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Material(
          color: selected
              ? scheme.primaryContainer
              : scheme.surface,
          borderRadius: BorderRadius.circular(14),
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: onTap,
            child: Container(
              constraints: const BoxConstraints(minHeight: 52),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: selected ? scheme.primary : scheme.outlineVariant,
                  width: selected ? 2 : 1,
                ),
              ),
              child: Row(
                children: [
                  if (label.isNotEmpty) ...[
                    Text(label,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: scheme.primary,
                            )),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: Text(text,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                  if (selected)
                    Icon(Icons.check_circle, color: scheme.primary),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
