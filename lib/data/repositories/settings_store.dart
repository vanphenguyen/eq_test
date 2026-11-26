import 'package:shared_preferences/shared_preferences.dart';

/// Per-device preferences. Not assessment data; deleted only on request.
class SettingsStore {
  SettingsStore(this._prefs);

  final SharedPreferences _prefs;

  static const _kLanguage = 'settings.language';
  static const _kOnboarded = 'settings.onboardingComplete';
  static const _kPremium = 'entitlement.premiumLifetime';

  String? get languageCode {
    try {
      return _prefs.getString(_kLanguage);
    } catch (_) {
      return null;
    }
  }

  Future<void> setLanguageCode(String code) =>
      _prefs.setString(_kLanguage, code);

  bool get onboardingComplete => _prefs.getBool(_kOnboarded) ?? false;

  Future<void> setOnboardingComplete() => _prefs.setBool(_kOnboarded, true);

  /// Local cache only. StoreKit remains the source of truth and refreshes it
  /// on launch and on restore (SRS-F-067).
  bool get premiumCached => _prefs.getBool(_kPremium) ?? false;

  Future<void> setPremiumCached(bool value) =>
      _prefs.setBool(_kPremium, value);
}
