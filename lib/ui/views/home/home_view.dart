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
      body: Container(
        color: appColors.conditionalColor,
        child: Center(
          child: Text(
            'Hello World',
            style: TextStyle(color: appColors.primary),
          ),
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
