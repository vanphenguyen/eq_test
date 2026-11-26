import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../app/providers.dart';
import '../../data/store/premium_service.dart';
import '../../l10n/app_localizations.dart';

class PaywallScreen extends ConsumerStatefulWidget {
  const PaywallScreen({super.key});

  @override
  ConsumerState<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends ConsumerState<PaywallScreen> {
  ProductDetails? _product;
  bool _loadedProduct = false;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _loadProduct();
  }

  Future<void> _loadProduct() async {
    final product = await ref.read(premiumServiceProvider).loadProduct();
    if (mounted) {
      setState(() {
        _product = product;
        _loadedProduct = true;
      });
    }
  }

  void _show(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _buy() async {
    final l = AppLocalizations.of(context);
    setState(() => _busy = true);
    final outcome = await ref.read(premiumServiceProvider).purchase();
    if (!mounted) return;
    setState(() => _busy = false);
    final message = switch (outcome) {
      PurchaseOutcome.success => l.restoreFound,
      PurchaseOutcome.pending => l.purchasePending,
      PurchaseOutcome.cancelled => l.purchaseCancelled,
      PurchaseOutcome.failed => l.purchaseFailed,
      PurchaseOutcome.productUnavailable => l.productUnavailable,
      PurchaseOutcome.storeUnavailable => l.storeUnavailable,
    };
    _show(message);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);

    // Close automatically once a verified purchase or restore unlocks Premium.
    ref.listen(premiumProvider, (_, next) {
      if (next.value == true && context.mounted) {
        context.pop();
      }
    });

    final benefits = [
      l.paywallBenefit1,
      l.paywallBenefit2,
      l.paywallBenefit3,
      l.paywallBenefit4,
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          tooltip: l.closeAction,
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(l.paywallHeadline, style: theme.textTheme.headlineSmall),
            const SizedBox(height: 16),
            for (final b in benefits)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check, color: theme.colorScheme.primary),
                    const SizedBox(width: 10),
                    Expanded(child: Text(b)),
                  ],
                ),
              ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(l.paywallPayOnce,
                        style: theme.textTheme.titleMedium,
                        textAlign: TextAlign.center),
                    const SizedBox(height: 6),
                    Text(l.paywallLifetimeNote,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall),
                    if (_product != null) ...[
                      const SizedBox(height: 12),
                      // Price is always the StoreKit-localized value.
                      Text(_product!.price,
                          style: theme.textTheme.headlineSmall),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_loadedProduct && _product == null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(l.productUnavailable,
                    textAlign: TextAlign.center),
              ),
            FilledButton(
              onPressed: _busy || _product == null ? null : _buy,
              child: Text(l.buyPremium),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: _busy
                  ? null
                  : () async {
                      await ref.read(premiumServiceProvider).restore();
                    },
              child: Text(l.restorePurchases),
            ),
            const SizedBox(height: 16),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              children: [
                TextButton(
                  onPressed: null,
                  child: Text(l.termsLink),
                ),
                TextButton(
                  onPressed: null,
                  child: Text(l.privacyLink),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
