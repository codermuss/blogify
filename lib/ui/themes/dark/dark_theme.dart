import 'package:blogify/ui/themes/dark/dark_color_palette.dart';
import 'package:flutter/material.dart';

import '../app_theme_colors.dart';

class DarkTheme {
  static final AppThemeColors colors = AppThemeColors(
    primary: DarkColorPalette.greenPrimary,
    onPrimary: DarkColorPalette.white,
    secondary: DarkColorPalette.greenSecondary,
    onSecondary: DarkColorPalette.white,
    surface: DarkColorPalette.white, // Use for background-like areas
    onSurface: DarkColorPalette.black, // Text on background-like areas
    error: DarkColorPalette.red,
    onError: DarkColorPalette.white,
    conditionalColor: Colors.black,
  );

  static ThemeData get themeData {
    return ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: colors.primary,
          onPrimary: colors.onPrimary,
          secondary: colors.secondary,
          onSecondary: colors.onSecondary,
          surface: colors.surface,
          onSurface: colors.onSurface,
          error: colors.error,
          onError: colors.onError,
        ),
        scaffoldBackgroundColor: colors.surface, // Set scaffold background to match surface
        extensions: <ThemeExtension<AppThemeColors>>[colors]);
  }
}
