import 'package:flutter/material.dart';

class WedlyColors {
  static const plum = Color(0xFF3D1F2E);
  static const rose = Color(0xFF8E3B52);
  static const gold = Color(0xFFC9A45C);
  static const blush = Color(0xFFF3DCD6);
  static const cream = Color(0xFFFCF4E8);
  static const sage = Color(0xFFE2E8DB);
  static const ink = Color(0xFF32272B);
  static const muted = Color(0xFF786A6D);
  static const surface = Color(0xFFFFFCF8);
  static const border = Color(0xFFE9DDD2);
}

ThemeData buildWedlyTheme() {
  const scheme = ColorScheme(
    brightness: Brightness.light,
    primary: WedlyColors.rose,
    onPrimary: Colors.white,
    secondary: WedlyColors.gold,
    onSecondary: WedlyColors.plum,
    error: Color(0xFFB3261E),
    onError: Colors.white,
    surface: WedlyColors.surface,
    onSurface: WedlyColors.ink,
  );
  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: WedlyColors.cream,
    fontFamily: 'DMSans',
    textTheme: const TextTheme(
      displaySmall: TextStyle(fontFamily: 'CormorantGaramond', fontWeight: FontWeight.w600, color: WedlyColors.plum),
      headlineLarge: TextStyle(fontFamily: 'CormorantGaramond', fontWeight: FontWeight.w600, color: WedlyColors.plum),
      headlineMedium: TextStyle(fontFamily: 'CormorantGaramond', fontWeight: FontWeight.w600, color: WedlyColors.plum),
      titleLarge: TextStyle(fontFamily: 'CormorantGaramond', fontWeight: FontWeight.w600, color: WedlyColors.plum),
      bodyLarge: TextStyle(color: WedlyColors.ink),
      bodyMedium: TextStyle(color: WedlyColors.ink),
      bodySmall: TextStyle(color: WedlyColors.muted),
      labelLarge: TextStyle(fontWeight: FontWeight.w600),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: WedlyColors.cream,
      foregroundColor: WedlyColors.plum,
      elevation: 0,
      centerTitle: false,
    ),
    cardTheme: CardThemeData(
      color: WedlyColors.surface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: const BorderSide(color: WedlyColors.border),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: WedlyColors.surface,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: WedlyColors.border)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: WedlyColors.border)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: WedlyColors.rose, width: 1.5)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: Colors.redAccent)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: WedlyColors.surface,
      indicatorColor: WedlyColors.blush,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}
