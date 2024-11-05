import 'package:blogify/ui/widgets/common/base_app_bar/base_app_bar.dart';
import 'package:blogify/ui/widgets/common/base_view_skeleton/base_view_skeleton.dart';
import 'package:blogify/ui/widgets/common/content_block_small/content_block_small.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.router.dart';
import '../../../localization/locale_keys.g.dart';
import '../../styles/spaces.dart';
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
      appBar: BaseAppBar(
        title: LocaleKeys.home,
        actions: [
          IconButton(
            onPressed: () {
              viewModel.navigationService.clearStackAndShow(Routes.onboardingView);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Column(
        children: [
          ContentBlockSmall.small(
            imageUrl: 'https://picsum.photos/200/300',
            title: 'Header',
            subTitle: 'Hell want to use your yacht, and I dont want this thing smelling like fish.',
            time: '8m ago',
          ),
          Spaces.verticalSpaceMedium,
          ContentBlockSmall.large(
            imageUrl: 'https://picsum.photos/200/300',
            title: 'Header',
            subTitle: 'Hell want to use your yacht, and I dont want this thing smelling like fish.',
            time: '8m ago',
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
