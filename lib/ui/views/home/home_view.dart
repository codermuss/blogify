import 'package:blogify/ui/widgets/common/base_app_bar/base_app_bar.dart';
import 'package:blogify/ui/widgets/common/base_view_skeleton/base_view_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../localization/locale_keys.g.dart';
import '../../widgets/common/bottom_nav_bar/bottom_nav_bar.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return BaseViewSkeleton(
      appBar: const BaseAppBar(
        title: LocaleKeys.home,
      ),
      body: PageView(
        controller: viewModel.pageController,
        children: const [
          Text('1'),
          Text('2'),
          Text('3'),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        onTabSelected: viewModel.changePage,
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onDispose(HomeViewModel viewModel) {
    viewModel.disposeViewModel();
    super.onDispose(viewModel);
  }
}
