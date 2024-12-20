import 'package:blogify/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:blogify/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:blogify/ui/views/home/home_view.dart';
import 'package:blogify/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:blogify/services/app/theme_service.dart';
import 'package:blogify/ui/views/sign_up/sign_up_view.dart';
import 'package:blogify/ui/views/onboarding/onboarding_view.dart';
import 'package:blogify/services/api/onboarding_api_service.dart';
import 'package:blogify/services/api/auth_api_service.dart';
import 'package:blogify/ui/views/sign_in/sign_in_view.dart';
import 'package:blogify/services/app/hive_storage_service.dart';
import 'package:blogify/services/app/encryption_service.dart';
import 'package:blogify/services/app/view_model_helper_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: SignInView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ThemeService),
    LazySingleton(classType: OnboardingApiService),
    LazySingleton(classType: AuthApiService),
    LazySingleton(classType: HiveStorageService),
    LazySingleton(classType: EncryptionService),
    LazySingleton(classType: ViewModelHelperService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
