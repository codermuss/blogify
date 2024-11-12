import 'package:blogify/mixin/viewmodel_supporter.dart';
import 'package:blogify/models/request/auth/sign_in_request.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../models/response/auth/sign_in_response.dart';
import '../../../services/api/auth_api_service.dart';
import '../../../utilities/constants/app_strings.dart';

class SignInViewModel extends BaseViewModel with ViewModelSupporter {
  /// MARK: - [Dependencies]

  final AuthApiService _authApiService = locator<AuthApiService>();

  /// MARK: - [Properties]

  /// MARK: - [Getters & Setters]

  /// MARK: - [Initializer]

  /// MARK: - [Reset]

  /// MARK: - [Methods]

  Future<void> signIn({required SignInRequest signInRequest}) async {
    SignInResponse? response = await runLoadingFuture<SignInResponse>(() => _authApiService.signIn(request: signInRequest));
    if (response != null) {
      await storageService.saveData(AppStrings.accessToken, response.accessToken);
      navigationService.clearStackAndShow(Routes.homeView);
    }
  }
}
