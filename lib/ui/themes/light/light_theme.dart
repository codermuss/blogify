import 'package:flutter/material.dart';

import '../app_theme_colors.dart';
import 'light_color_palette.dart';

class LightTheme {
  static final AppThemeColors colors = AppThemeColors(
    primary: LightColorPalette.greenPrimary,
    onPrimary: LightColorPalette.white,
    secondary: LightColorPalette.greenSecondary,
    onSecondary: LightColorPalette.white,
    surface: LightColorPalette.white, // Use for background-like areas
    onSurface: LightColorPalette.black, // Text on background-like areas
    error: LightColorPalette.red,
    onError: LightColorPalette.white,
    conditionalColor: Colors.amber,
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
