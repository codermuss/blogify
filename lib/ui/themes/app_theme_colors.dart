import 'package:flutter/material.dart';

class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color white;
  final Color black;
  final Color gray01;
  final Color gray02;
  final Color gray03;
  final Color gray04;
  final Color greenPrimary;
  final Color greenSecondary;
  final Color red;

  AppThemeColors({
    required this.greenPrimary,
    required this.white,
    required this.greenSecondary,
    required this.black,
    required this.gray01,
    required this.gray02,
    required this.gray03,
    required this.gray04,
    required this.red,
  });

  @override
  AppThemeColors copyWith(
      {Color? primary,
      Color? onPrimary,
      Color? secondary,
      Color? onSecondary,
      Color? background,
      Color? onBackground,
      Color? surface,
      Color? onSurface,
      Color? error,
      Color? onError,
      Color? conditionalColor}) {
    return AppThemeColors(
      greenPrimary: primary ?? greenPrimary,
      white: onPrimary ?? white,
      greenSecondary: secondary ?? greenSecondary,
      black: onSecondary ?? black,
      gray01: surface ?? gray01,
      gray02: onSurface ?? gray02,
      gray03: error ?? gray03,
      gray04: onError ?? gray04,
      red: conditionalColor ?? red,
    );
  }

  @override
  AppThemeColors lerp(ThemeExtension<AppThemeColors>? other, double t) {
    if (other is! AppThemeColors) return this;
    return AppThemeColors(
      greenPrimary: Color.lerp(greenPrimary, other.greenPrimary, t)!,
      white: Color.lerp(white, other.white, t)!,
      greenSecondary: Color.lerp(greenSecondary, other.greenSecondary, t)!,
      black: Color.lerp(black, other.black, t)!,
      gray01: Color.lerp(gray01, other.gray01, t)!,
      gray02: Color.lerp(gray02, other.gray02, t)!,
      gray03: Color.lerp(gray03, other.gray03, t)!,
      gray04: Color.lerp(gray04, other.gray04, t)!,
      red: Color.lerp(red, other.red, t)!,
    );
  }
}
