import 'package:blogify/app/app.bottomsheets.dart';
import 'package:blogify/app/app.dialogs.dart';
import 'package:blogify/app/app.locator.dart';
import 'package:blogify/app/app.router.dart';
import 'package:blogify/main_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ViewModelBuilder.reactive(
          viewModelBuilder: () => MainViewmodel(),
          builder: (context, viewModel, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.startupView,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            navigatorKey: StackedService.navigatorKey,
            theme: viewModel.theme,
            navigatorObservers: [StackedService.routeObserver],
          ),
        );
      },
    );
  }
}
