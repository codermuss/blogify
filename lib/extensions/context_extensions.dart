import 'package:blogify/ui/themes/app_theme_colors.dart';
import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  ThemeData get _theme => Theme.of(this);
  AppThemeColors get palette => _theme.extension<AppThemeColors>()!;
  TextTheme get textTheme => _theme.textTheme;
}
