import 'package:blogify/extensions/widget_extensions.dart';
import 'package:blogify/ui/components/buttons/app_button.dart';
import 'package:blogify/ui/components/inputs/app_text_field.dart';
import 'package:blogify/ui/components/inputs/checkbox/checkbox_form_field.dart';
import 'package:blogify/ui/components/inputs/checkbox/checkbox_form_item.dart';
import 'package:blogify/ui/styles/spaces.dart';
import 'package:blogify/ui/widgets/common/base_app_bar/base_app_bar.dart';
import 'package:blogify/ui/widgets/common/base_view_skeleton/base_view_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'sign_up_viewmodel.dart';

class SignUpView extends StackedView<SignUpViewModel> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignUpViewModel viewModel,
    Widget? child,
  ) {
    return BaseViewSkeleton(
      appBar: BaseAppBar(
        title: 'Sign Up',
        actions: [TextButton(onPressed: () {}, child: const Text('Login'))],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spaces.verticalSpaceMedium,
            AppTextFormField(
              controller: TextEditingController(),
              hintText: 'Name',
            ),
            AppTextFormField(
              controller: TextEditingController(),
              hintText: 'Email',
            ),
            AppTextFormField(
              controller: TextEditingController(),
              hintText: 'Password',
              obscureText: true,
              suffix: TextButton(onPressed: () {}, child: const Text('Show')),
            ),
            Spaces.verticalSpaceMedium,
            CheckboxFormField(
              context: context,
              checkboxFormItem: CheckboxFormItem(
                title: 'I would like to receive your newsletter and other promotional information.',
              ),
            ),
            Spaces.verticalSpaceMedium,
            AppButton.primary(context: context, label: 'Sign Up', onPressed: () {}),
            TextButton(onPressed: () {}, child: const Text('Forgot your password?'))
          ],
        ).p16h,
      ),
    );
  }

  @override
  SignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignUpViewModel();
}
