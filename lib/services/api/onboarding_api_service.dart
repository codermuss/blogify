import 'package:blogify/app/app.locator.dart';
import 'package:blogify/models/base/base_response.dart';
import 'package:blogify/models/response/onboarding/onboarding.dart';
import 'package:blogify/network/clients/dio/dio_http_client.dart';

class OnboardingApiService {
  /// MARK: - [Dependencies]
  final DioHttpClient _dioHttpClient = locator<DioHttpClient>();

  /// MARK: - [Methods]
  Future<BaseResponse<List<Onboarding>?>> getOnboarding() async {
    final response = await _dioHttpClient.fetch<Onboarding, List<Onboarding>?>(
      path: '/onboardings',
      fromJson: Onboarding.fromJson,
    );
    return response;
  }
}
