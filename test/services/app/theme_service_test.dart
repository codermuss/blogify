import 'package:blogify/app/app.locator.dart';
import 'package:blogify/services/app/theme_service.dart';
import 'package:blogify/ui/themes/theme_modes.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_helpers.dart';

void main() {
  group('ThemeServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    test('can be instantiated', () {
      expect(ThemeService(), isNotNull);
    });

    test('can change theme', () {
      final ThemeService themeService = ThemeService();
      themeService.toggleTheme(AppThemeMode.dark);
      expect(themeService.themeMode, AppThemeMode.dark);
    });
  });
}
