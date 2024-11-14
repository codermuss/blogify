import 'package:blogify/app/app.locator.dart';
import 'package:blogify/mixin/viewmodel_supporter.dart';
import 'package:blogify/services/app/theme_service.dart';
import 'package:blogify/ui/themes/theme_modes.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends IndexTrackingViewModel with ViewModelSupporter {
  /// MARK: - [Dependencies]
  final ThemeService _themeService = locator<ThemeService>();
  final PageController pageController = PageController();

  /// MARK: - [Properties]

  /// MARK: - [Getters & Setters]

  /// MARK: - [Initializer]

  /// MARK: - [Reset]
  void disposeViewModel() {
    pageController.dispose();
  }

  /// MARK: - [Methods]

  void changeTheme(AppThemeMode mode) {
    _themeService.toggleTheme(mode);
  }

  void changePage(int index) {
    pageController.jumpToPage(index);
    setIndex(index);
  }
}
