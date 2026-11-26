import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../l10n/app_localizations.dart';
import 'providers.dart';
import 'router.dart';
import 'theme.dart';

class EqTestApp extends ConsumerStatefulWidget {
  const EqTestApp({super.key});

  @override
  ConsumerState<EqTestApp> createState() => _EqTestAppState();
}

class _EqTestAppState extends ConsumerState<EqTestApp> {
  late final GoRouter _router = buildRouter();

  @override
  Widget build(BuildContext context) {
    final code = ref.watch(localeProvider);
    return MaterialApp.router(
      title: 'EQ Test',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
      themeMode: ThemeMode.system,
      locale: Locale(code),
      supportedLocales: const [Locale('en'), Locale('vi')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
