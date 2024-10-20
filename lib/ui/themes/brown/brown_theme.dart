import 'package:flutter/material.dart';

import '../app_theme_colors.dart';
import 'brown_color_palette.dart';

class BrownTheme {
  static final AppThemeColors colors = AppThemeColors(
    greenPrimary: BrownColorPalette.greenPrimary,
    white: BrownColorPalette.white,
    greenSecondary: BrownColorPalette.greenSecondary,
    black: BrownColorPalette.black,
    gray01: BrownColorPalette.gray01, // Use for background-like areas
    gray02: BrownColorPalette.gray02, // Text on background-like areas
    gray03: BrownColorPalette.gray03,
    gray04: BrownColorPalette.gray04,
    red: BrownColorPalette.red,
  );

  static ThemeData get themeData {
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: colors.greenPrimary),
        scaffoldBackgroundColor: colors.gray01, // Set scaffold background to match surface
        extensions: <ThemeExtension<AppThemeColors>>[colors]);
  }
}
