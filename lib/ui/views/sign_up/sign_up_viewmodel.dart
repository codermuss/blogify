import 'package:blogify/mixin/viewmodel_supporter.dart';
import 'package:blogify/models/request/sign_up_request.dart';
import 'package:blogify/services/api/auth_api_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import 'sign_up_form_helper.dart';

class SignUpViewModel extends BaseViewModel with SignUpFormHelper, ViewModelSupporter {
  /// MARK: - [Dependencies]
  final AuthApiService _authApiService = locator<AuthApiService>();

  /// MARK: - [Properties]

  /// MARK: - [Getters & Setters]

  /// MARK: - [Initializer]

  /// MARK: - [Reset]

  /// MARK: - [Methods]

  Future<void> signUp() async {
    final SignUpRequest? request = createRequestModel<SignUpRequest>(validateForm);
    if (request != null) {
      await runLoadingFuture(() async => await _authApiService.signUp(request));
    }
  }
}
