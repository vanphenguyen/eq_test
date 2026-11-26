import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../app/providers.dart';
import '../../data/repositories/assessment_repository.dart';
import '../../domain/models.dart';
import '../../domain/result_content.dart';
import '../../domain/scoring.dart';
import '../../l10n/app_localizations.dart';
import '../common/widgets.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({super.key, required this.sessionId});

  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final entry = ref.watch(resultEntryProvider(sessionId));
    final content = ref.watch(resultContentProvider).value;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          tooltip: l.closeAction,
          onPressed: () => context.go('/home'),
        ),
      ),
      body: entry.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => Center(child: Text(l.genericError)),
        data: (e) {
          if (e == null || content == null) {
            return Center(child: Text(l.genericError));
          }
          return _ResultBody(entry: e, content: content);
        },
      ),
    );
  }
}

class _ResultBody extends StatelessWidget {
  const _ResultBody({required this.entry, required this.content});

  final HistoryEntry entry;
  final ResultContent content;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final locale = localeCodeOf(context);
    final theme = Theme.of(context);
    final isFull = entry.type == AssessmentType.full;
    final overall = entry.overallIndex;
    final band = entry.band;
    final dims = entry.dimensions;

    final strengths = [
      for (final d in Dimension.values)
        if (dims[d]!.band.index >= InterpretationBand.growing.index) d,
    ];
    final growth = [
      for (final d in Dimension.values)
        if (dims[d]!.band.index < InterpretationBand.growing.index) d,
    ];

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(l.resultTitle, style: theme.textTheme.titleSmall),
                  const SizedBox(height: 8),
                  Text(
                    '${overall.round()}',
                    style: theme.textTheme.displayLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                    semanticsLabel: '${overall.round()} out of 100',
                  ),
                  const SizedBox(height: 4),
                  Chip(label: Text(bandLabel(l, band))),
                  const SizedBox(height: 12),
                  Text(
                    content.overallBands[band]!.resolve(locale),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          ReflectionCaveat(text: l.resultCaveat),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  for (final d in Dimension.values)
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () =>
                          context.push('/result/${entry.sessionId}/dimension/${d.code}'),
                      child: Row(
                        children: [
                          Expanded(
                            child: DimensionBar(
                              label: dimensionLabel(l, d),
                              index: dims[d]!.index,
                            ),
                          ),
                          const Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (isFull) ...[
            const SizedBox(height: 16),
            _BulletSection(
              title: l.strengthsTitle,
              dims: strengths,
              texts: content.dimensionStrengths,
              locale: locale,
              l: l,
            ),
            const SizedBox(height: 12),
            _BulletSection(
              title: l.growthTitle,
              dims: growth,
              texts: content.dimensionGrowth,
              locale: locale,
              l: l,
            ),
          ] else ...[
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l.practicalSuggestion, style: theme.textTheme.titleSmall),
                    const SizedBox(height: 8),
                    for (final d in growth.isEmpty ? Dimension.values : growth)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          '${dimensionLabel(l, d)}: '
                          '${content.dimensionSuggestion[d]!.resolve(locale)}',
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
          const SizedBox(height: 20),
          if (isFull)
            FilledButton(
              onPressed: () =>
                  context.push('/result/${entry.sessionId}/plan'),
              child: Text(l.sevenDayPlanAction),
            ),
          if (isFull) const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: () => _openShare(context, entry, l, locale),
            icon: const Icon(Icons.ios_share),
            label: Text(l.shareResult),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => context.go('/home'),
            child: Text(l.backToHome),
          ),
        ],
      ),
    );
  }
}

class _BulletSection extends StatelessWidget {
  const _BulletSection({
    required this.title,
    required this.dims,
    required this.texts,
    required this.locale,
    required this.l,
  });

  final String title;
  final List<Dimension> dims;
  final Map<Dimension, LocalizedText> texts;
  final String locale;
  final AppLocalizations l;

  @override
  Widget build(BuildContext context) {
    if (dims.isEmpty) return const SizedBox.shrink();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            for (final d in dims)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  '${dimensionLabel(l, d)}: ${texts[d]!.resolve(locale)}',
                ),
              ),
          ],
        ),
      ),
    );
  }
}

Future<void> _openShare(
  BuildContext context,
  HistoryEntry entry,
  AppLocalizations l,
  String locale,
) {
  return showDialog<void>(
    context: context,
    builder: (_) => _SharePreviewDialog(
      entry: entry,
      l: l,
      locale: locale,
    ),
  );
}

/// Share card: overall score, bands and dimension values only. It never
/// contains raw answers or item-level data (SRS-F-047).
class _ShareCard extends StatelessWidget {
  const _ShareCard({required this.entry, required this.l});

  final HistoryEntry entry;
  final AppLocalizations l;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 320,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFBFAF7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l.appName,
              style: theme.textTheme.labelLarge
                  ?.copyWith(color: const Color(0xFF4B3FA6))),
          const SizedBox(height: 12),
          Text(l.resultTitle, style: theme.textTheme.titleSmall),
          Text(
            '${entry.overallIndex.round()} · ${bandLabel(l, entry.band)}',
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          for (final d in Dimension.values)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                '${dimensionLabel(l, d)}: ${entry.dimensions[d]!.index.round()}',
                style: theme.textTheme.bodyMedium,
              ),
            ),
          const SizedBox(height: 12),
          Text(l.shareCaveat, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}

class _SharePreviewDialog extends StatefulWidget {
  const _SharePreviewDialog({
    required this.entry,
    required this.l,
    required this.locale,
  });

  final HistoryEntry entry;
  final AppLocalizations l;
  final String locale;

  @override
  State<_SharePreviewDialog> createState() => _SharePreviewDialogState();
}

class _SharePreviewDialogState extends State<_SharePreviewDialog> {
  final _key = GlobalKey();
  bool _sharing = false;

  Future<void> _share() async {
    setState(() => _sharing = true);
    try {
      final boundary =
          _key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 3);
      final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/eq_test_result.png')
        ..writeAsBytesSync(bytes!.buffer.asUint8List());
      await SharePlus.instance.share(
        ShareParams(files: [XFile(file.path, mimeType: 'image/png')]),
      );
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(widget.l.shareFailed)),
        );
      }
    } finally {
      if (mounted) setState(() => _sharing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.l.sharePreviewTitle,
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 12),
            RepaintBoundary(
              key: _key,
              child: _ShareCard(entry: widget.entry, l: widget.l),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _sharing ? null : _share,
              child: Text(widget.l.shareAction),
            ),
          ],
        ),
      ),
    );
  }
}
