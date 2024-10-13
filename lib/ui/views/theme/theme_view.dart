import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'theme_viewmodel.dart';

class ThemeView extends StackedView<ThemeViewModel> {
  const ThemeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ThemeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  ThemeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ThemeViewModel();
}
