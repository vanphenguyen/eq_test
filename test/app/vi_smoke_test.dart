import 'package:drift/native.dart';
import 'package:eq_test/app/app.dart';
import 'package:eq_test/app/providers.dart';
import 'package:eq_test/data/db/app_database.dart';
import 'package:eq_test/data/repositories/settings_store.dart';
import 'package:eq_test/data/store/premium_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Lets real async work (asset loads, SQLite) finish, then settles frames.
Future<void> settle(WidgetTester t) async {
  for (var i = 0; i < 5; i++) {
    await t.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 30)));
    await t.pumpAndSettle();
  }
}

/// Waits (with real time) until [finder] shows up, then settles frames.
Future<void> waitFor(WidgetTester t, Finder finder) async {
  for (var i = 0; i < 200 && finder.evaluate().isEmpty; i++) {
    await t.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 20)));
    await t.pump();
  }
  await settle(t);
}

void main() {
  testWidgets('Vietnamese UI and content render on the home tabs', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final db = AppDatabase(NativeDatabase.memory());
    final premium = PremiumService(SettingsStore(prefs));

    await tester.pumpWidget(ProviderScope(
      overrides: [
        sharedPrefsProvider.overrideWithValue(prefs),
        databaseProvider.overrideWithValue(db),
        premiumServiceProvider.overrideWithValue(premium),
      ],
      child: const EqTestApp(),
    ));
    await waitFor(tester, find.text('Skip'));
    await tester.tap(find.text('Skip'));
    await settle(tester);
    await tester.tap(find.text('Tiếng Việt'));
    await settle(tester);
    await tester.tap(find.widgetWithText(FilledButton, 'Continue'));
    await settle(tester);

    expect(find.text('Trang chủ'), findsWidgets);
    expect(find.text('Bài test nhanh'), findsWidgets);
    expect(find.text('Đang phát triển'), findsNothing);

    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 1));
  });
}
