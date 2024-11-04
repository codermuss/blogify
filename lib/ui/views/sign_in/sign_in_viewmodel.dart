import 'package:blogify/mixin/viewmodel_supporter.dart';
import 'package:blogify/ui/views/sign_in/sign_in_form_helper.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../services/api/auth_api_service.dart';

class SignInViewModel extends BaseViewModel with ViewModelSupporter, SignInFormHelper {
  /// MARK: - [Dependencies]

  final AuthApiService _authApiService = locator<AuthApiService>();

  /// MARK: - [Properties]

  /// MARK: - [Getters & Setters]

  /// MARK: - [Initializer]

  /// MARK: - [Reset]

  /// MARK: - [Methods]

  Future<void> signIn() async {
    final signInRequest = createRequestModel(validateForm);
    if (signInRequest != null) {
      await runLoadingFuture(() => _authApiService.signIn(signInRequest));
    }
  }
}
