import 'dart:async';

import 'package:in_app_purchase/in_app_purchase.dart';

import '../repositories/settings_store.dart';

enum PurchaseOutcome { success, pending, cancelled, failed, productUnavailable, storeUnavailable }

/// Wraps StoreKit through in_app_purchase. Premium is unlocked only from a
/// verified purchase or restore status, never from a button tap.
class PremiumService {
  PremiumService(this._settings, {InAppPurchase? iap}) : _injectedIap = iap;

  static const productId = 'eqtest_premium_lifetime';

  final SettingsStore _settings;
  final InAppPurchase? _injectedIap;

  /// Created lazily so the platform store is not contacted until needed.
  InAppPurchase get _iap => _injectedIap ?? InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _sub;
  final _controller = StreamController<bool>.broadcast();
  final _outcomes = StreamController<PurchaseOutcome>.broadcast();
  bool _premium = false;

  bool get isPremium => _premium;
  Stream<bool> get premiumChanges => _controller.stream;
  Stream<PurchaseOutcome> get outcomes => _outcomes.stream;

  /// Call once at launch. Uses the cached value until StoreKit replies.
  Future<void> start() async {
    _premium = _settings.premiumCached;
    _controller.add(_premium);
    _sub ??= _iap.purchaseStream.listen(_onUpdates, onError: (_) {});
    // Restores pending transactions from StoreKit on launch.
    try {
      if (await _iap.isAvailable()) {
        await _iap.restorePurchases();
      }
    } catch (_) {
      // Free features keep working when the store is unavailable (SRS-F-068).
    }
  }

  Future<ProductDetails?> loadProduct() async {
    if (!await _iap.isAvailable()) return null;
    final response = await _iap.queryProductDetails({productId});
    if (response.productDetails.isEmpty) return null;
    return response.productDetails.first;
  }

  Future<PurchaseOutcome> purchase() async {
    final product = await loadProduct();
    if (product == null) {
      return await _iap.isAvailable()
          ? PurchaseOutcome.productUnavailable
          : PurchaseOutcome.storeUnavailable;
    }
    final started = await _iap.buyNonConsumable(
      purchaseParam: PurchaseParam(productDetails: product),
    );
    return started ? PurchaseOutcome.pending : PurchaseOutcome.failed;
  }

  Future<void> restore() async {
    if (!await _iap.isAvailable()) {
      _outcomes.add(PurchaseOutcome.storeUnavailable);
      return;
    }
    await _iap.restorePurchases();
  }

  void _onUpdates(List<PurchaseDetails> updates) {
    for (final p in updates) {
      if (p.productID != productId) continue;
      switch (p.status) {
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          _grant();
          _outcomes.add(PurchaseOutcome.success);
        case PurchaseStatus.pending:
          _outcomes.add(PurchaseOutcome.pending);
        case PurchaseStatus.canceled:
          _outcomes.add(PurchaseOutcome.cancelled);
        case PurchaseStatus.error:
          _outcomes.add(PurchaseOutcome.failed);
      }
      if (p.pendingCompletePurchase) {
        _iap.completePurchase(p);
      }
    }
  }

  Future<void> _grant() async {
    _premium = true;
    await _settings.setPremiumCached(true);
    _controller.add(true);
  }

  void dispose() {
    _sub?.cancel();
    _controller.close();
    _outcomes.close();
  }
}
