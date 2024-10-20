import 'package:blogify/app/app.locator.dart';
import 'package:blogify/mixin/viewmodel_supporter.dart';
import 'package:blogify/services/api/onboarding_api_service.dart';
import 'package:stacked/stacked.dart';

class OnboardingViewModel extends BaseViewModel with ViewModelSupporter {
  /// MARK: - [Dependencies]
  final OnboardingApiService _onboardingApiService = locator<OnboardingApiService>();

  /// MARK: - [Properties]

  /// MARK: - [Getters & Setters]
  final String onboardings = 'onboardings';

  /// MARK: - [Initializer]
  Future<void> init() async {
    await _getOnboardings();
  }

  /// MARK: - [Reset]

  /// MARK: - [Methods]
  Future<void> _getOnboardings() async {
    await handleViewStateByRequest(onboardings, _onboardingApiService.getOnboarding);
  }
}
