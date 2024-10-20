import 'package:blogify/extensions/context_extensions.dart';
import 'package:blogify/extensions/widget_extensions.dart';
import 'package:blogify/ui/components/buttons/app_button.dart';
import 'package:blogify/ui/components/inputs/checkbox/checkbox_form_field.dart';
import 'package:blogify/ui/components/inputs/checkbox/checkbox_form_item.dart';
import 'package:blogify/ui/components/navigation/app_tab_bar.dart';
import 'package:blogify/ui/components/navigation/tab_item.dart';
import 'package:blogify/ui/themes/theme_modes.dart';
import 'package:blogify/ui/widgets/common/content_block_small/content_block_small.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../components/inputs/app_text_field.dart';
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
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => viewModel.changeTheme(AppThemeMode.light),
              child: Text(
                'Light',
                style: TextStyle(color: context.palette.greenPrimary),
              ),
            ),
            InkWell(
              onTap: () => viewModel.changeTheme(AppThemeMode.dark),
              child: Text(
                'Dark',
                style: TextStyle(color: context.palette.greenPrimary),
              ),
            ),
            Spaces.verticalSpaceMedium,
            InkWell(
              onTap: () => viewModel.changeTheme(AppThemeMode.brown),
              child: Text(
                'Brown',
                style: TextStyle(color: context.palette.greenPrimary),
              ),
            ),
            Spaces.verticalSpaceMedium,
            AppButton.primary(context: context, label: 'Button Primary', onPressed: () {}),
            Spaces.verticalSpaceMedium,
            AppButton.secondary(
                context: context,
                label: 'Button Secondary',
                onPressed: () {
                  formKey.currentState?.validate();
                }),
            Spaces.verticalSpaceMedium,
            Form(
              key: formKey,
              child: Column(
                children: [
                  AppTextFormField.input(
                    controller: controller,
                    hintText: 'Hint',
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                  Spaces.verticalSpaceSmall,
                  AppTextFormField.search(
                    controller: controller,
                    hintText: 'Hint',
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                  Spaces.verticalSpaceSmall,
                  AppTextFormField(
                    controller: controller,
                    hintText: 'Hint',
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                  Spaces.verticalSpaceSmall,
                  AppTextFormField(
                    controller: controller,
                    hintText: 'Hint',
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                    type: AppTextField.search,
                  ),
                ],
              ),
            ).p8a,
            AppTabBar(
              tabs: [
                TabItem(label: 'Posts', page: const Text('Posts Page')),
                TabItem(label: 'Photos', page: const Text('Photos Page')),
              ],
              height: 100.h,
            ).p8a,
            Spaces.verticalSpaceMedium,
            CheckboxFormField(context: context, checkboxFormItem: CheckboxFormItem(title: 'Text here'), isRequired: true),
            Spaces.verticalSpaceMedium,
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
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
