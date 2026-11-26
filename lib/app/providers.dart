import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/db/app_database.dart';
import '../data/repositories/assessment_repository.dart';
import '../data/repositories/settings_store.dart';
import '../data/store/premium_service.dart';
import '../domain/models.dart';
import '../domain/result_content.dart';
import '../domain/scoring.dart';

/// Overridden in main() once storage is open.
final sharedPrefsProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError('sharedPrefsProvider not overridden'),
);
final databaseProvider = Provider<AppDatabase>(
  (ref) => throw UnimplementedError('databaseProvider not overridden'),
);
final premiumServiceProvider = Provider<PremiumService>(
  (ref) => throw UnimplementedError('premiumServiceProvider not overridden'),
);

final settingsStoreProvider = Provider<SettingsStore>(
  (ref) => SettingsStore(ref.watch(sharedPrefsProvider)),
);

final contentProvider = FutureProvider<ContentBundle>((ref) async {
  final raw = await rootBundle.loadString('assets/content/question_bank.json');
  return ContentBundle.fromJson(jsonDecode(raw) as Map<String, dynamic>);
});

final resultContentProvider = FutureProvider<ResultContent>((ref) async {
  final raw = await rootBundle.loadString('assets/content/result_content.json');
  return ResultContent.fromJson(jsonDecode(raw) as Map<String, dynamic>);
});

final assessmentRepositoryProvider =
    FutureProvider<AssessmentRepository>((ref) async {
  final content = await ref.watch(contentProvider.future);
  return AssessmentRepository(
    db: ref.watch(databaseProvider),
    engine: ScoringEngine(content),
    contentVersion: content.contentVersion,
    scoringVersion: content.scoringVersion,
  );
});

/// Current UI language. Only 'en' and 'vi' are supported.
class LocaleController extends Notifier<String> {
  @override
  String build() {
    final saved = ref.watch(settingsStoreProvider).languageCode;
    return (saved == 'vi' || saved == 'en') ? saved! : 'en';
  }

  Future<void> set(String code) async {
    state = code;
    await ref.read(settingsStoreProvider).setLanguageCode(code);
  }
}

final localeProvider =
    NotifierProvider<LocaleController, String>(LocaleController.new);

final premiumProvider = StreamProvider<bool>((ref) async* {
  final service = ref.watch(premiumServiceProvider);
  yield service.isPremium;
  yield* service.premiumChanges;
});

final historyProvider = StreamProvider<List<HistoryEntry>>((ref) async* {
  final repo = await ref.watch(assessmentRepositoryProvider.future);
  yield* repo.watchHistory();
});

final resultEntryProvider =
    FutureProvider.family<HistoryEntry?, String>((ref, sessionId) async {
  final repo = await ref.watch(assessmentRepositoryProvider.future);
  return repo.getResult(sessionId);
});

final planProgressProvider =
    StreamProvider.family<Set<int>, String>((ref, sessionId) async* {
  final repo = await ref.watch(assessmentRepositoryProvider.future);
  yield* repo.watchCompletedPlanDays(sessionId);
});
