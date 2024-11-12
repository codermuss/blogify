import 'package:blogify/app/app.locator.dart';
import 'package:blogify/models/request/auth/sign_in_request.dart';
import 'package:blogify/services/app/view_model_helper_service.dart';
import 'package:blogify/ui/views/sign_in/sign_in_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SignInViewModel', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
    test('can be instantiated', () {
      expect(SignInViewModel(), isNotNull);
    });

    test(
      'sign in success',
      () async {
        final SignInViewModel signInViewModel = SignInViewModel();
        final SignInRequest req = SignInRequest(username: 'username', password: 'password');
        await signInViewModel.signIn(signInRequest: req);
        verify(locator<ViewModelHelperService>().runLoadingFuture(any, any)).called(1);
      },
    );
  });
}
