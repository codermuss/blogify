import 'package:blogify/app/app.locator.dart';
import 'package:blogify/services/api/onboarding_api_service.dart';
import 'package:blogify/services/app/theme_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:blogify/services/api/auth_api_service.dart';
import 'package:blogify/services/app/hive_storage_service.dart';
import 'package:blogify/services/app/encryption_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ThemeService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<OnboardingApiService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthApiService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<HiveStorageService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<EncryptionService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterThemeService();
  getAndRegisterOnboardingApiService();
  getAndRegisterAuthApiService();
  getAndRegisterHiveStorageService();
  getAndRegisterEncryptionService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) => Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockThemeService getAndRegisterThemeService() {
  _removeRegistrationIfExists<ThemeService>();
  final service = MockThemeService();
  locator.registerSingleton<ThemeService>(service);
  return service;
}

MockOnboardingApiService getAndRegisterOnboardingApiService() {
  _removeRegistrationIfExists<OnboardingApiService>();
  final service = MockOnboardingApiService();
  locator.registerSingleton<OnboardingApiService>(service);
  return service;
}

MockAuthApiService getAndRegisterAuthApiService() {
  _removeRegistrationIfExists<AuthApiService>();
  final service = MockAuthApiService();
  locator.registerSingleton<AuthApiService>(service);
  return service;
}

MockHiveStorageService getAndRegisterHiveStorageService() {
  _removeRegistrationIfExists<HiveStorageService>();
  final service = MockHiveStorageService();
  locator.registerSingleton<HiveStorageService>(service);
  return service;
}

MockEncryptionService getAndRegisterEncryptionService() {
  _removeRegistrationIfExists<EncryptionService>();
  final service = MockEncryptionService();
  locator.registerSingleton<EncryptionService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
