import 'package:stacked/stacked.dart';

import '../../ui/themes/theme_modes.dart';

class ThemeService with ListenableServiceMixin {
  /// MARK: - [Properties]
  ThemeMode _themeMode = ThemeMode.light;

  /// MARK: - [Getters & Setters]

  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  /// MARK: - [Methods]

  ThemeService() {
    listenToReactiveValues([_themeMode]);
  }

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
