import 'package:blogify/ui/themes/theme_modes.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../themes/app_theme_colors.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    final appColors = Theme.of(context).extension<AppThemeColors>()!;

    return Scaffold(
      backgroundColor: appColors.conditionalColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => viewModel.changeTheme(AppThemeMode.light),
              child: Text(
                'Light',
                style: TextStyle(color: appColors.primary),
              ),
            ),
            InkWell(
              onTap: () => viewModel.changeTheme(AppThemeMode.dark),
              child: Text(
                'Dark',
                style: TextStyle(color: appColors.primary),
              ),
            ),
            InkWell(
              onTap: () => viewModel.changeTheme(AppThemeMode.brown),
              child: Text(
                'Brown',
                style: TextStyle(color: appColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
