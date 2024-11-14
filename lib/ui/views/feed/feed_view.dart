import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'feed_viewmodel.dart';

class FeedView extends StackedView<FeedViewModel> {
  const FeedView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FeedViewModel viewModel,
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
  FeedViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FeedViewModel();
}
