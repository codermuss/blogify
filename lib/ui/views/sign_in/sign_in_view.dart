import 'package:blogify/extensions/widget_extensions.dart';
import 'package:blogify/ui/components/buttons/app_button.dart';
import 'package:blogify/ui/widgets/common/base_app_bar/base_app_bar.dart';
import 'package:blogify/ui/widgets/common/base_view_skeleton/base_view_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../localization/locale_keys.g.dart';
import '../../../utilities/validators/validators.dart';
import '../../components/inputs/app_text_field.dart';
import '../../styles/spaces.dart';
import '../../widgets/common/locale_text/locale_text.dart';
import 'sign_in_viewmodel.dart';

class SignInView extends StackedView<SignInViewModel> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignInViewModel viewModel,
    Widget? child,
  ) {
    return BaseViewSkeleton(
      appBar: BaseAppBar(
        title: LocaleKeys.singIn,
        actions: [
          TextButton(
            onPressed: () {},
            child: LocaleText(
              LocaleKeys.singUp,
            ),
          )
        ],
      ),
      body: Form(
        key: viewModel.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spaces.verticalSpaceMedium,
            AppTextFormField(
              controller: viewModel.usernameController,
              hintText: LocaleKeys.username,
              validator: Validators.validateuserame,
            ),
            AppTextFormField(
              controller: viewModel.passwordController,
              hintText: LocaleKeys.password,
              obscureText: true,
              validator: Validators.validatePassword,
            ),
            Spaces.verticalSpaceMedium,
            AppButton.primary(
              context: context,
              label: LocaleKeys.singIn,
              onPressed: viewModel.signIn,
            ),
          ],
        ),
      ).p16h,
    );
  }

  @override
  SignInViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignInViewModel();
}
