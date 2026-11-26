import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/links.dart';
import '../../app/providers.dart';
import '../../data/store/premium_service.dart';
import '../../l10n/app_localizations.dart';

class SettingsTab extends ConsumerStatefulWidget {
  const SettingsTab({super.key});

  @override
  ConsumerState<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends ConsumerState<SettingsTab> {
  StreamSubscription<PurchaseOutcome>? _outcomes;

  @override
  void initState() {
    super.initState();
    _outcomes = ref.read(premiumServiceProvider).outcomes.listen((o) {
      if (!mounted) return;
      final l = AppLocalizations.of(context);
      final msg = switch (o) {
        PurchaseOutcome.success => l.restoreFound,
        PurchaseOutcome.pending => l.purchasePending,
        PurchaseOutcome.cancelled => l.purchaseCancelled,
        PurchaseOutcome.failed => l.purchaseFailed,
        PurchaseOutcome.productUnavailable => l.productUnavailable,
        PurchaseOutcome.storeUnavailable => l.storeUnavailable,
      };
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(msg)));
    });
  }

  @override
  void dispose() {
    _outcomes?.cancel();
    super.dispose();
  }

  Future<void> _pickLanguage() async {
    final l = AppLocalizations.of(context);
    final current = ref.read(localeProvider);
    final chosen = await showModalBottomSheet<String>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(l.languageEnglish),
              trailing: current == 'en' ? const Icon(Icons.check) : null,
              onTap: () => Navigator.pop(ctx, 'en'),
            ),
            ListTile(
              title: Text(l.languageVietnamese),
              trailing: current == 'vi' ? const Icon(Icons.check) : null,
              onTap: () => Navigator.pop(ctx, 'vi'),
            ),
          ],
        ),
      ),
    );
    if (chosen != null) {
      await ref.read(localeProvider.notifier).set(chosen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final premium = ref.watch(premiumProvider).value ?? false;
    final code = ref.watch(localeProvider);
    final contentVersion =
        ref.watch(contentProvider).value?.contentVersion ?? '';

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(l.settingsTitle, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.translate),
              title: Text(l.settingsLanguage),
              subtitle: Text(code == 'vi' ? l.languageVietnamese : l.languageEnglish),
              onTap: _pickLanguage,
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.workspace_premium_outlined),
                  title: Text(l.settingsPremium),
                  subtitle: Text(premium ? l.premiumActive : l.premiumInactive),
                ),
                ListTile(
                  leading: const Icon(Icons.restore),
                  title: Text(l.restorePurchases),
                  onTap: () => ref.read(premiumServiceProvider).restore(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.shield_outlined),
              title: Text(l.settingsPrivacy),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push('/settings/privacy'),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.description_outlined),
                  title: Text(l.settingsTerms),
                  trailing: const Icon(Icons.open_in_new, size: 18),
                  onTap: () => launchUrl(Uri.parse(AppLinks.terms),
                      mode: LaunchMode.externalApplication),
                ),
                ListTile(
                  leading: const Icon(Icons.mail_outline),
                  title: Text(l.settingsSupport),
                  trailing: const Icon(Icons.open_in_new, size: 18),
                  onTap: () => launchUrl(Uri.parse(AppLinks.support),
                      mode: LaunchMode.externalApplication),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text(l.settingsAbout),
              subtitle: Text(l.aboutBody),
              isThreeLine: true,
              trailing: contentVersion.isEmpty
                  ? null
                  : Text(l.contentVersion(contentVersion),
                      style: Theme.of(context).textTheme.labelSmall),
            ),
          ),
        ],
      ),
    );
  }
}
