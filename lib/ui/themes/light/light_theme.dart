import 'package:flutter/material.dart';

import '../app_theme_colors.dart';
import 'light_color_palette.dart';

class LightTheme {
  static final AppThemeColors colors = AppThemeColors(
    greenPrimary: LightColorPalette.greenPrimary,
    white: LightColorPalette.white,
    greenSecondary: LightColorPalette.greenSecondary,
    black: LightColorPalette.black,
    gray01: LightColorPalette.gray01, // Use for background-like areas
    gray02: LightColorPalette.gray02, // Text on background-like areas
    gray03: LightColorPalette.gray03,
    gray04: LightColorPalette.gray04,
    red: LightColorPalette.red,
  );

  static ThemeData get themeData {
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: colors.greenPrimary),
        scaffoldBackgroundColor: colors.white, // Use for background-like areas
        extensions: <ThemeExtension<AppThemeColors>>[colors]);
  }
}
