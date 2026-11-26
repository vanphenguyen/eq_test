import 'package:flutter/material.dart';

/// Premium Minimal Psychology palette: indigo primary, soft blue secondary,
/// warm white background. Colors are tokens, not hardcoded in widgets.
class AppColors {
  static const primary = Color(0xFF4B3FA6);
  static const secondary = Color(0xFF7FA7E0);
  static const background = Color(0xFFFBFAF7);
  static const surface = Color(0xFFFFFFFF);
  static const textPrimary = Color(0xFF1B1B22);
  static const textSecondary = Color(0xFF5E5E6B);
  static const darkBackground = Color(0xFF15141B);
  static const darkSurface = Color(0xFF1F1E27);
}

ThemeData buildLightTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.surface,
    brightness: Brightness.light,
  );
  return _base(scheme, AppColors.background);
}

ThemeData buildDarkTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.darkSurface,
    brightness: Brightness.dark,
  );
  return _base(scheme, AppColors.darkBackground);
}

ThemeData _base(ColorScheme scheme, Color background) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: background,
    cardTheme: CardThemeData(
      elevation: 0,
      color: scheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(0, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(0, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: background,
      foregroundColor: scheme.onSurface,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
  );
}
