import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../app/providers.dart';
import '../../l10n/app_localizations.dart';
import '../common/widgets.dart';

class HistoryTab extends ConsumerWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final code = localeCodeOf(context);
    final history = ref.watch(historyProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l.historyTitle, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Expanded(
              child: history.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (_, _) => Text(l.genericError),
                data: (entries) {
                  if (entries.isEmpty) {
                    return _Empty(l: l);
                  }
                  final fmt = DateFormat.yMMMd(code).add_Hm();
                  return ListView.separated(
                    itemCount: entries.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 10),
                    itemBuilder: (_, i) {
                      final e = entries[i];
                      final typeLabel = e.type.code == 'full'
                          ? l.fullLabel
                          : l.quickLabel;
                      return Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          onTap: () => context.push('/result/${e.sessionId}'),
                          title: Text(typeLabel),
                          subtitle: Text(
                              '${fmt.format(e.completedAt)} · ${bandLabel(l, e.band)}'),
                          trailing: Text(
                            '${e.overallIndex.round()}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty({required this.l});
  final AppLocalizations l;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(l.historyEmptyTitle,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(l.historyEmptyBody, textAlign: TextAlign.center),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () => context.push('/assessment/quick/intro'),
            child: Text(l.startQuickTest),
          ),
        ],
      ),
    );
  }
}
