import 'package:blogify/extensions/context_extensions.dart';
import 'package:blogify/extensions/widget_extensions.dart';
import 'package:blogify/localization/locale_keys.g.dart';
import 'package:blogify/ui/styles/paddings.dart';
import 'package:blogify/ui/styles/radiuses.dart';
import 'package:blogify/ui/styles/spaces.dart';
import 'package:blogify/ui/styles/text_styles.dart';
import 'package:blogify/ui/widgets/common/locale_text/locale_text.dart';
import 'package:blogify/ui/widgets/common/view_state_handler/view_state_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../models/response/onboarding/onboarding.dart';
import 'onboarding_viewmodel.dart';

part 'onboarding_widget.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: ViewStateHandler<List<Onboarding>>(
        viewState: viewModel.getStateForObject(viewModel.onboardings),
        dataBuilder: (List<Onboarding> onboardingData) => Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: viewModel.pageController,
              itemCount: onboardingData.length,
              onPageChanged: viewModel.setIndex,
              itemBuilder: (context, index) {
                final data = onboardingData[index];
                return _OnboardingWidget(
                  image: data.image,
                  title: data.title,
                  description: data.description,
                );
              },
            ),
            Positioned(
              bottom: 80.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(onboardingData.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    margin: Paddings.p4h,
                    height: 8.h,
                    width: viewModel.currentIndex == index ? 24.w : 8.w,
                    decoration: BoxDecoration(
                      color: viewModel.currentIndex == index ? Colors.white : Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  );
                }),
              ),
            ),
            Positioned(
              bottom: 24.w,
              left: 24.w,
              right: 24.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (viewModel.currentIndex > 0)
                    TextButton(
                      onPressed: viewModel.previousPage,
                      child: LocaleText(
                        LocaleKeys.back,
                        style: AppTextStyles.bodyText1.copyWith(color: context.palette.white),
                      ),
                    ),
                  const Spacer(),
                  TextButton(
                    onPressed: viewModel.onNext,
                    child: LocaleText(
                      viewModel.currentIndex == onboardingData.length - 1 ? LocaleKeys.getStarted : LocaleKeys.next,
                      style: AppTextStyles.bodyText1.copyWith(color: context.palette.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnboardingViewModel();
  @override
  Future<void> onViewModelReady(OnboardingViewModel viewModel) async {
    super.onViewModelReady(viewModel);
    await viewModel.init();
  }
}
