import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../data/repositories/assessment_repository.dart';
import '../../l10n/app_localizations.dart';
import '../common/widgets.dart';
import '../history/history_screen.dart';
import '../settings/settings_screen.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: const [
          _HomeTab(),
          _TestsTab(),
          HistoryTab(),
          SettingsTab(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          NavigationDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home),
              label: l.tabHome),
          NavigationDestination(
              icon: const Icon(Icons.assignment_outlined),
              selectedIcon: const Icon(Icons.assignment),
              label: l.tabTests),
          NavigationDestination(
              icon: const Icon(Icons.history),
              label: l.tabHistory),
          NavigationDestination(
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              label: l.tabSettings),
        ],
      ),
    );
  }
}

class _HomeTab extends ConsumerWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final premium = ref.watch(premiumProvider).value ?? false;
    final history = ref.watch(historyProvider);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 8),
          Text(l.homeGreeting, style: theme.textTheme.headlineSmall),
          const SizedBox(height: 20),
          _ActionCard(
            title: l.quickTestTitle,
            meta: l.quickTestMeta,
            tag: l.freeTag,
            icon: Icons.bolt_outlined,
            primary: true,
            onTap: () => context.push('/assessment/quick/intro'),
          ),
          const SizedBox(height: 12),
          _ActionCard(
            title: l.fullAssessmentTitle,
            meta: l.fullAssessmentMeta,
            tag: premium ? l.premiumTag : l.premiumLockLabel,
            icon: premium ? Icons.auto_awesome_outlined : Icons.lock_outline,
            primary: false,
            onTap: () => premium
                ? context.push('/assessment/full/intro')
                : context.push('/paywall'),
          ),
          const SizedBox(height: 20),
          history.when(
            loading: () => const SizedBox.shrink(),
            error: (_, _) => const SizedBox.shrink(),
            data: (entries) => _LatestCard(entry: entries.isEmpty ? null : entries.first),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l.insightTitle, style: theme.textTheme.titleSmall),
                  const SizedBox(height: 6),
                  Text(l.insightBody),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LatestCard extends StatelessWidget {
  const _LatestCard({required this.entry});
  final HistoryEntry? entry;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    if (entry == null) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(l.noResultYet),
        ),
      );
    }
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => context.push('/result/${entry!.sessionId}'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l.latestResultTitle, style: theme.textTheme.titleSmall),
                    const SizedBox(height: 4),
                    Text(bandLabel(l, entry!.band)),
                  ],
                ),
              ),
              Text(
                '${entry!.overallIndex.round()}',
                style: theme.textTheme.headlineMedium
                    ?.copyWith(color: theme.colorScheme.primary),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required this.title,
    required this.meta,
    required this.tag,
    required this.icon,
    required this.primary,
    required this.onTap,
  });

  final String title;
  final String meta;
  final String tag;
  final IconData icon;
  final bool primary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      color: primary ? scheme.primary : null,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Icon(icon,
                  size: 32,
                  color: primary ? scheme.onPrimary : scheme.primary),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: primary ? scheme.onPrimary : null,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      meta,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: primary
                                ? scheme.onPrimary
                                : scheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: primary
                      ? scheme.onPrimary.withValues(alpha: 0.18)
                      : scheme.secondaryContainer,
                ),
                child: Text(
                  tag,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: primary
                            ? scheme.onPrimary
                            : scheme.onSecondaryContainer,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TestsTab extends ConsumerWidget {
  const _TestsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final premium = ref.watch(premiumProvider).value ?? false;
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(l.testsTitle, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 20),
          _ActionCard(
            title: l.quickTestTitle,
            meta: l.quickTestMeta,
            tag: l.freeTag,
            icon: Icons.bolt_outlined,
            primary: true,
            onTap: () => context.push('/assessment/quick/intro'),
          ),
          const SizedBox(height: 12),
          _ActionCard(
            title: l.fullAssessmentTitle,
            meta: l.fullAssessmentMeta,
            tag: premium ? l.premiumTag : l.unlockWithPremium,
            icon: premium ? Icons.auto_awesome_outlined : Icons.lock_outline,
            primary: false,
            onTap: () => premium
                ? context.push('/assessment/full/intro')
                : context.push('/paywall'),
          ),
        ],
      ),
    );
  }
}
