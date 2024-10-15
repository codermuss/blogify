import 'package:flutter/material.dart';

import '../app_theme_colors.dart';
import 'brown_color_palette.dart';

class BrownTheme {
  static final AppThemeColors colors = AppThemeColors(
    primary: BrownColorPalette.greenPrimary,
    onPrimary: BrownColorPalette.white,
    secondary: BrownColorPalette.greenSecondary,
    onSecondary: BrownColorPalette.white,
    surface: BrownColorPalette.white, // Use for background-like areas
    onSurface: BrownColorPalette.black, // Text on background-like areas
    error: BrownColorPalette.red,
    onError: BrownColorPalette.white,
    conditionalColor: Colors.brown,
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
