import 'package:blogify/ui/themes/dark/dark_color_palette.dart';
import 'package:flutter/material.dart';

import '../app_theme_colors.dart';

class DarkTheme {
  static final AppThemeColors colors = AppThemeColors(
    greenPrimary: DarkColorPalette.greenPrimary,
    white: DarkColorPalette.white,
    greenSecondary: DarkColorPalette.greenSecondary,
    black: DarkColorPalette.black,
    gray01: DarkColorPalette.gray01, // Use for background-like areas
    gray02: DarkColorPalette.gray02, // Text on background-like areas
    gray03: DarkColorPalette.gray03,
    gray04: DarkColorPalette.gray04,
    red: DarkColorPalette.red,
  );

  static ThemeData get themeData {
    return ThemeData(
        colorScheme: const ColorScheme.dark(),
        scaffoldBackgroundColor: colors.gray01, // Set scaffold background to match surface
        extensions: <ThemeExtension<AppThemeColors>>[colors]);
  }
}
