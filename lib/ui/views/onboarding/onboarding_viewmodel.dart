import 'package:blogify/app/app.locator.dart';
import 'package:blogify/services/api/onboarding_api_service.dart';
import 'package:stacked/stacked.dart';

class OnboardingViewModel extends BaseViewModel {
  /// MARK: - [Dependencies]
  final OnboardingApiService _onboardingApiService = locator<OnboardingApiService>();

  /// MARK: - [Properties]

  /// MARK: - [Getters & Setters]

  /// MARK: - [Initializer]
  Future<void> init() async {
    await _getOnboardings();
  }

  /// MARK: - [Reset]

  /// MARK: - [Methods]
  Future<void> _getOnboardings() async {
    await _onboardingApiService.getOnboarding();
  }
}
