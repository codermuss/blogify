import 'package:blogify/ui/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../ui/themes/theme_modes.dart';

class ThemeService with ListenableServiceMixin {
  /// MARK: - [Properties]
  AppThemeMode _themeMode = AppThemeMode.light;

  /// MARK: - [Getters & Setters]

  AppThemeMode get themeMode => _themeMode;
  ThemeData get theme => _themeMode == AppThemeMode.light
      ? AppThemes.lightTheme
      : _themeMode == AppThemeMode.brown
          ? AppThemes.brownTheme
          : AppThemes.darkTheme;
  bool get isDarkMode => _themeMode == AppThemeMode.dark;

  /// MARK: - [Methods]

  ThemeService() {
    listenToReactiveValues([_themeMode]);
  }

  void toggleTheme(AppThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
