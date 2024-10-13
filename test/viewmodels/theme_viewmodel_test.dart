import 'package:flutter_test/flutter_test.dart';
import 'package:blogify/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ThemeViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
