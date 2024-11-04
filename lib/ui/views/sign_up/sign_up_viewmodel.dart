import 'package:blogify/app/app.router.dart';
import 'package:blogify/mixin/viewmodel_supporter.dart';
import 'package:blogify/models/request/auth/sign_up_request.dart';
import 'package:blogify/models/response/auth/sign_up_response.dart';
import 'package:blogify/services/api/auth_api_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import 'sign_up_form_helper.dart';

class SignUpViewModel extends BaseViewModel with SignUpFormHelper, ViewModelSupporter {
  /// MARK: - [Dependencies]
  final AuthApiService _authApiService = locator<AuthApiService>();

  /// MARK: - [Properties]
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  /// MARK: - [Getters & Setters]

  bool get obscurePassword => _obscurePassword;

  void setObscurePassword(bool value) {
    _obscurePassword = value;
    notifyListeners();
  }

  bool get obscureConfirmPassword => _obscureConfirmPassword;

  void setObscureConfirmPassword(bool value) {
    _obscureConfirmPassword = value;
    notifyListeners();
  }

  /// MARK: - [Initializer]

  /// MARK: - [Reset]

  /// MARK: - [Methods]

  Future<void> signUp() async {
    final SignUpRequest? request = createRequestModel<SignUpRequest>(validateForm);
    if (request != null) {
      SignUpResponse? response = await runLoadingFuture(() async => await _authApiService.signUp(request));
      if (response != null) navigationService.navigateToSignInView();
    }
  }
}
