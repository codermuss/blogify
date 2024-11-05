import 'package:blogify/app/app.locator.dart';
import 'package:blogify/app/app.router.dart';
import 'package:blogify/mixin/viewmodel_supporter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../utilities/constants/app_strings.dart';

class StartupViewModel extends BaseViewModel with ViewModelSupporter {
  final _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    print(storageService.getData(AppStrings.accessToken));
    if (await storageService.getData(AppStrings.accessToken) != null) {
      _navigationService.replaceWithHomeView();
      return;
    }

    _navigationService.replaceWithOnboardingView();
  }
}
