import 'package:blogify/extensions/widget_extensions.dart';
import 'package:blogify/models/request/auth/sign_in_request.dart';
import 'package:blogify/ui/components/buttons/app_button.dart';
import 'package:blogify/ui/views/sign_in/sign_in_form_helper.dart';
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

class SignInView extends StackedView<SignInViewModel> with SignInFormHelper {
  SignInView({Key? key}) : super(key: key);

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
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spaces.verticalSpaceMedium,
            AppTextFormField(
              controller: usernameController,
              hintText: LocaleKeys.username,
              validator: Validators.validateuserame,
            ),
            AppTextFormField(
              controller: passwordController,
              hintText: LocaleKeys.password,
              obscureText: true,
              validator: Validators.validatePassword,
            ),
            Spaces.verticalSpaceMedium,
            AppButton.primary(
              context: context,
              label: LocaleKeys.singIn,
              onPressed: () => viewModel.signIn(signInRequest: SignInRequest(username: usernameController.text, password: passwordController.text)),
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

  @override
  void onDispose(SignInViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }
}
