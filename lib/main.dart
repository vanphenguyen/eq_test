import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'app/providers.dart';
import 'data/db/app_database.dart';
import 'data/repositories/settings_store.dart';
import 'data/store/premium_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final db = await AppDatabase.open();
  final premium = PremiumService(SettingsStore(prefs));
  await premium.start();

  runApp(
    ProviderScope(
      overrides: [
        sharedPrefsProvider.overrideWithValue(prefs),
        databaseProvider.overrideWithValue(db),
        premiumServiceProvider.overrideWithValue(premium),
      ],
      child: const EqTestApp(),
    ),
  );
}
