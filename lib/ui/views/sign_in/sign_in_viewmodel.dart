import 'package:blogify/mixin/viewmodel_supporter.dart';
import 'package:blogify/models/response/auth/sign_in_response.dart';
import 'package:blogify/ui/views/sign_in/sign_in_form_helper.dart';
import 'package:blogify/utilities/constants/app_strings.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
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
      SignInResponse? response = await runLoadingFuture<SignInResponse>(() => _authApiService.signIn(signInRequest));
      if (response != null) {
        await storageService.saveData(AppStrings.accessToken, response.accessToken);
        print(storageService.getData(AppStrings.accessToken));
        navigationService.clearStackAndShow(Routes.homeView);
      }
    }
  }
}
