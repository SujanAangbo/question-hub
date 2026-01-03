import 'package:flutter/material.dart';
import 'package:question_hub/theme/text_theme.dart';

import 'color_palette.dart';

class AppTheme {
  static OutlineInputBorder border(final Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: color, width: 2),
  );

  static ThemeData theme(BuildContext context) => ThemeData(
    fontFamily: 'Inter',
    useMaterial3: true,
    scaffoldBackgroundColor: ColorPalette.onSecondary,
    colorScheme: ColorScheme.light(
      primary: ColorPalette.primary,
      onPrimary: ColorPalette.onPrimary,
      secondary: ColorPalette.secondary,
      onSecondary: ColorPalette.onSecondary,
      tertiary: ColorPalette.tertiary,
      onTertiary: ColorPalette.onTertiary,
      surface: ColorPalette.surface,
      onSurface: ColorPalette.onSurface,
      error: ColorPalette.error,
      onError: ColorPalette.onError,
      outline: ColorPalette.outline,
    ),
    textTheme: interTextTheme,

    // scaffoldBackgroundColor: ColorPalette.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorPalette.primary,
      foregroundColor: ColorPalette.white,
      titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
        color: ColorPalette.onPrimary,
        fontFamily: 'PlayFair',
        fontSize: 26,
      ),
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      // backgroundColor: ColorPalette.blueColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: border(ColorPalette.outline),
      disabledBorder: border(ColorPalette.disabled),
      focusedBorder: border(ColorPalette.primary),
      errorBorder: border(ColorPalette.error),
      focusedErrorBorder: border(ColorPalette.primary),
      hintStyle: Theme.of(
        context,
      ).textTheme.bodyLarge!.copyWith(color: ColorPalette.hintColor),
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: ColorPalette.primaryDark,
      onPrimary: ColorPalette.onPrimaryDark,
      secondary: ColorPalette.secondaryDark,
      onSecondary: ColorPalette.onSecondaryDark,
      tertiary: ColorPalette.tertiaryDark,
      onTertiary: ColorPalette.onTertiaryDark,
      surface: ColorPalette.surfaceDark,
      onSurface: ColorPalette.onSurfaceDark,
      error: ColorPalette.errorDark,
      onError: ColorPalette.onErrorDark,
      outline: ColorPalette.outlineDark,
    ),
    textTheme: interTextTheme,
    // scaffoldBackgroundColor: ColorPalette.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
        color: Theme.of(context).colorScheme.onPrimary,
        fontFamily: 'PlayFair',
        fontSize: 26,
      ),
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      // backgroundColor: ColorPalette.blueColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: border(ColorPalette.outline),
      disabledBorder: border(ColorPalette.disabled),
      focusedBorder: border(ColorPalette.primary),
      errorBorder: border(ColorPalette.error),
      focusedErrorBorder: border(ColorPalette.primary),
      hintStyle: Theme.of(
        context,
      ).textTheme.bodyLarge!.copyWith(color: ColorPalette.hintColor),
    ),
  );
}
