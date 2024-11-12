import 'package:blogify/app/app.locator.dart';
import 'package:blogify/models/base/base_response.dart';
import 'package:blogify/models/request/auth/sign_in_request.dart';
import 'package:blogify/models/request/auth/sign_up_request.dart';
import 'package:blogify/models/response/auth/sign_in_response.dart';
import 'package:blogify/models/response/auth/sign_up_response.dart';
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
      when(authApiService.signIn(request: signInRequest)).thenAnswer((_) async => BaseResponse.success(
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
      await authApiService.signIn(request: signInRequest);
      verify(authApiService.signIn(request: signInRequest)).called(1);
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
        when(authApiService.signIn(request: signInRequest)).thenAnswer((_) async => errorResponse);
        final response = await authApiService.signIn(request: signInRequest);
        expect(response, errorResponse);
      },
    );

    test('sign up success', () async {
      final authApiService = getAndRegisterAuthApiService();
      final SignUpRequest signUpRequest = SignUpRequest(
        username: 'test',
        password: 'password',
        fullName: 'test',
        email: 'test@test.com',
        confirmPassword: 'password',
        birthdate: '1222-22-22',
      );
      when(authApiService.signUp(request: signUpRequest)).thenAnswer((_) async => BaseResponse.success(
            SignUpResponse(
              user: User.empty(),
              profile: Profile.empty(),
            ),
            null,
          ));
      await authApiService.signUp(request: signUpRequest);
      verify(authApiService.signUp(request: signUpRequest)).called(1);
    });

    test('sign up failure', () async {
      final authApiService = getAndRegisterAuthApiService();
      final SignUpRequest signUpRequest = SignUpRequest(
        username: 'test',
        password: 'password',
        fullName: 'test',
        email: 'test@test.com',
        confirmPassword: 'password',
        birthdate: '1222-22-22',
      );
      final errorResponse = BaseResponse<SignUpResponse>.error(null);
      when(authApiService.signUp(request: signUpRequest)).thenAnswer((_) async => errorResponse);
      final response = await authApiService.signUp(request: signUpRequest);
      expect(response, errorResponse);
    });
  });
}
