import 'package:flutter/material.dart';

class ColorPalette {
  ColorPalette._();

  /// light theme color
  static const Color primary = Color(0xFF4B5C92);
  static const Color onPrimary = Color(0xFFFFFFFF);

  static const Color secondary = Color(0xFF595E72);
  static const Color onSecondary = Color(0xFFFFFFFF);

  static const Color tertiary = Color(0xFF745470);
  static const Color onTertiary = Color(0xFFFFFFFF);

  static const Color surface = Color(0xFFFAF8FF);
  static const Color onSurface = Color(0xFF1A1B21);

  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);

  static const Color outline = Color(0xFF757680);

  /// dark theme colors
  static const Color primaryDark = Color(0xFFB4C5FF);
  static const Color onPrimaryDark = Color(0xFF1A2D60);

  static const Color secondaryDark = Color(0xFFC1C5DD);
  static const Color onSecondaryDark = Color(0xFF2B3042);

  static const Color tertiaryDark = Color(0xFFE2BBDB);
  static const Color onTertiaryDark = Color(0xFF422741);

  static const Color surfaceDark = Color(0xFF121318);
  static const Color onSurfaceDark = Color(0xFFE3E2E9);

  static const Color errorDark = Color(0xFFFFB4AB);
  static const Color onErrorDark = Color(0xFF690005);

  static const Color outlineDark = Color(0xFF8F909A);

  // ✅ Updated based on recommended palette
  static const Color success = Color(0xFF16A34A);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF0284C7);
  static const Color disabled = Color(0xFF9CA3AF);

  // common:
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color hintColor = Color(0xFF636262);
  static const Color grey = Colors.grey;
}
