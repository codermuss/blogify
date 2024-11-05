import 'package:blogify/app/app.locator.dart';
import 'package:blogify/ui/views/sign_in/sign_in_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SignInViewModel', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
    test('can be instantiated', () {
      expect(SignInViewModel(), isNotNull);
    });
  });
}
