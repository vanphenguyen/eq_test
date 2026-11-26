import 'package:drift/native.dart';
import 'package:eq_test/app/app.dart';
import 'package:eq_test/app/providers.dart';
import 'package:eq_test/data/db/app_database.dart';
import 'package:eq_test/data/repositories/settings_store.dart';
import 'package:eq_test/data/store/premium_service.dart';
import 'package:eq_test/features/common/widgets.dart';
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
  testWidgets('first run: onboarding, language, then a full Quick Test to a result',
      (tester) async {
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

    // Splash -> onboarding.
    await settle(tester);

    expect(find.text('Understand your emotional habits.'), findsOneWidget);

    // Onboarding -> language -> home.
    await tester.tap(find.text('Skip'));
    await settle(tester);
    await tester.tap(find.widgetWithText(FilledButton, 'Continue'));
    await settle(tester);
    expect(find.text('Quick Test'), findsWidgets);
    expect(find.text('Full Assessment'), findsWidgets);

    // Start the free Quick Test.
    await tester.tap(find.text('Quick Test').first);
    await settle(tester);
    await tester.tap(find.widgetWithText(FilledButton, 'Start'));
    await settle(tester);
    expect(find.text('1 of 12'), findsOneWidget);

    // Next stays disabled until an answer is chosen.
    final next = find.widgetWithText(FilledButton, 'Next');
    expect(tester.widget<FilledButton>(next).onPressed, isNull);

    for (var i = 1; i <= 12; i++) {
      expect(find.text('$i of 12'), findsOneWidget);
      // Pick the first option of the current question.
      await tester.tap(find.byType(ChoiceTile).first);
      await settle(tester);
      final label = i == 12 ? 'See my results' : 'Next';
      await tester.tap(find.widgetWithText(FilledButton, label));
      await settle(tester);
    }

    // Completion -> result.
    await tester.tap(find.widgetWithText(FilledButton, 'View my result'));
    await settle(tester);
    expect(find.text('Your EQ Reflection Index'), findsOneWidget);
    expect(find.textContaining('not a validated or diagnostic'), findsWidgets);
    expect(find.text('Self-Awareness'), findsWidgets);

    // Result is in history.
    await tester.tap(find.byIcon(Icons.close));
    await settle(tester);
    await tester.tap(find.text('History'));
    await settle(tester);
    expect(find.text('Quick Test'), findsWidgets);

    // Tear down streams and the database so no timers outlive the test.
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 1));
  });
}
