import 'package:blogify/app/app.locator.dart';
import 'package:blogify/models/base/base_response.dart';
import 'package:blogify/models/response/onboarding/onboarding.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helpers.dart';

void main() {
  group('OnboardingApiServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    test('get onboarding data success', () async {
      final onboardingApiService = getAndRegisterOnboardingApiService();
      when(onboardingApiService.getOnboarding()).thenAnswer((_) async => BaseResponse.success(List<Onboarding>.empty(), null));
      await onboardingApiService.getOnboarding();
      verify(onboardingApiService.getOnboarding()).called(1);
    });
  });
}
