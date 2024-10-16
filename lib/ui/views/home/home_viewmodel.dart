import 'package:blogify/app/app.locator.dart';
import 'package:blogify/services/app/theme_service.dart';
import 'package:blogify/ui/themes/theme_modes.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final ThemeService _themeService = locator<ThemeService>();

  void changeTheme(AppThemeMode mode) {
    _themeService.toggleTheme(mode);
  }
}
