import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:question_hub/theme/text_theme.dart';

import 'color_palette.dart';

class AppTheme {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: color, width: 1.5),
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Inter',

    colorScheme: const ColorScheme.light(
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

    appBarTheme: AppBarTheme(
      backgroundColor: ColorPalette.primary,
      foregroundColor: ColorPalette.surface,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      // titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
      //   color: ColorPalette.onPrimary,
      //   fontFamily: 'PlayFair',
      //   fontSize: 26,
      // ),
      titleTextStyle: interTextTheme.headlineMedium?.copyWith(
        color: ColorPalette.surface,
        fontFamily: 'PlayFair',
        fontSize: 26,
      ),
    ),

    scaffoldBackgroundColor: ColorPalette.surface,

    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: _border(ColorPalette.outline),
      disabledBorder: _border(ColorPalette.outline),
      focusedBorder: _border(ColorPalette.primary),
      errorBorder: _border(ColorPalette.error),
      focusedErrorBorder: _border(ColorPalette.error),
      hintStyle: TextStyle(color: ColorPalette.hintColor),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: ColorPalette.primary,
        foregroundColor: ColorPalette.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),

    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(ColorPalette.onSurface),
      ),
    ),

    tabBarTheme: TabBarThemeData(
      labelColor: ColorPalette.white,
      unselectedLabelColor: ColorPalette.outline,
    ),

    listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(
        color: ColorPalette.onSurface,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      subtitleTextStyle: TextStyle(
        color: ColorPalette.onSurface.withValues(alpha: 0.7),
        fontSize: 14,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Inter',

    colorScheme: const ColorScheme.dark(
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

    scaffoldBackgroundColor: ColorPalette.primaryDark,
    textTheme: interTextTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorPalette.surfaceDark,
      foregroundColor: ColorPalette.onSurfaceDark,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: ColorPalette.primaryDark,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: interTextTheme.headlineMedium?.copyWith(
        color: ColorPalette.onPrimaryDark,
        fontFamily: 'PlayFair',
        fontSize: 26,
      ),
    ),

    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.all(ColorPalette.onPrimaryDark),
      thumbColor: WidgetStateProperty.all(ColorPalette.primaryDark),
      trackOutlineColor: WidgetStatePropertyAll(ColorPalette.outlineDark),
    ),

    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: _border(ColorPalette.outlineDark),
      disabledBorder: _border(ColorPalette.outlineDark),
      focusedBorder: _border(ColorPalette.secondaryDark),
      errorBorder: _border(ColorPalette.errorDark),
      focusedErrorBorder: _border(ColorPalette.errorDark),
      hintStyle: TextStyle(color: ColorPalette.outlineDark),
    ),

    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(ColorPalette.surfaceDark),
      ),
    ),

    tabBarTheme: TabBarThemeData(
      labelColor: ColorPalette.white,
      unselectedLabelColor: ColorPalette.outlineDark,
    ),

    listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(
        color: ColorPalette.onSurfaceDark,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      subtitleTextStyle: TextStyle(
        color: ColorPalette.onSurfaceDark.withValues(alpha: 0.7),
        fontSize: 14,
      ),
    ),
  );
}
