import 'package:blogify/app/app.locator.dart';
import 'package:blogify/app/app.router.dart';
import 'package:blogify/models/base/base_response.dart';
import 'package:blogify/models/request/auth/sign_up_request.dart';
import 'package:blogify/services/api/auth_api_service.dart';
import 'package:blogify/services/app/view_model_helper_service.dart';
import 'package:blogify/ui/views/sign_up/sign_up_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('SignUpViewModel Tests -', () {
    late SignUpViewModel viewModel;
    late AuthApiService mockAuthService;
    late NavigationService mockNavigationService;

    setUp(() {
      registerServices();
      mockAuthService = getAndRegisterAuthApiService();
      mockNavigationService = getAndRegisterNavigationService();
      viewModel = SignUpViewModel();
    });

    tearDown(() => locator.reset());

    group('Password Visibility Tests -', () {
      test('signUp method should call the runLoadingFuture method', () async {
        final ViewModelHelperService mockHelperService = getAndRegisterViewModelHelperService();
        final viewModel = SignUpViewModel();
        final request =
            SignUpRequest(email: 'test@test.com', password: 'password123', username: 'testuser', fullName: 'Test User', confirmPassword: 'password123', birthdate: '1111-11-11');
        await viewModel.signUp(request: request);
        verify(mockHelperService.runLoadingFuture(any, any)).called(1);
      });
      test('initial password visibility should be obscured', () {
        expect(viewModel.obscurePassword, true);
        expect(viewModel.obscureConfirmPassword, true);
      });

      test('setObscurePassword should toggle password visibility', () {
        viewModel.setObscurePassword(false);
        expect(viewModel.obscurePassword, false);

        viewModel.setObscurePassword(true);
        expect(viewModel.obscurePassword, true);
      });

      test('setObscureConfirmPassword should toggle confirm password visibility', () {
        viewModel.setObscureConfirmPassword(false);
        expect(viewModel.obscureConfirmPassword, false);

        viewModel.setObscureConfirmPassword(true);
        expect(viewModel.obscureConfirmPassword, true);
      });
    });

    group('SignUp Method Tests -', () {
      final testRequest =
          SignUpRequest(email: 'test@test.com', password: 'password123', username: 'testuser', fullName: 'Test User', confirmPassword: 'password123', birthdate: '1111-11-11');

      test('failed signup should not navigate', () async {
        when(mockAuthService.signUp(request: testRequest)).thenAnswer((_) async => BaseResponse.error(null));

        await viewModel.signUp(request: testRequest);

        verifyNever(mockNavigationService.clearStackAndShow(Routes.signInView));
      });

      test('signup should handle api errors gracefully', () async {
        when(mockAuthService.signUp(request: testRequest)).thenThrow(Exception('API Error'));

        await viewModel.signUp(request: testRequest);

        verifyNever(mockNavigationService.clearStackAndShow(Routes.signInView));
      });
    });
  });
}
