import 'package:blogify/app/app.locator.dart';
import 'package:blogify/models/base/base_response.dart';
import 'package:blogify/models/request/auth/sign_in_request.dart';
import 'package:blogify/models/response/auth/sign_in_response.dart';
import 'package:blogify/services/api/auth_api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helpers.dart';

void main() {
  group('AuthApiServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    test('sign in success', () async {
      final authApiService = getAndRegisterAuthApiService();
      final SignInRequest signInRequest = SignInRequest(
        username: 'test',
        password: 'password',
      );
      when(authApiService.signIn(signInRequest)).thenAnswer((_) async => BaseResponse.success(
            SignInResponse(
              sessionId: 'sessionId',
              accessToken: 'accessToken',
              accessTokenExpiresAt: DateTime.now(),
              refreshToken: 'refreshToken',
              refreshTokenExpiresAt: DateTime.now(),
              user: User.empty(),
            ),
            null,
          ));
      await authApiService.signIn(signInRequest);
      verify(authApiService.signIn(signInRequest)).called(1);
    });

    test(
      'sign in failure',
      () async {
        final AuthApiService authApiService = getAndRegisterAuthApiService();
        final SignInRequest signInRequest = SignInRequest(
          username: 'test',
          password: 'password',
        );
        final errorResponse = BaseResponse<SignInResponse>.error(null);
        when(authApiService.signIn(signInRequest)).thenAnswer((_) async => errorResponse);
        final response = await authApiService.signIn(signInRequest);
        expect(response, errorResponse);
      },
    );
  });
}
