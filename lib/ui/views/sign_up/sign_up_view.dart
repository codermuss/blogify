import 'package:blogify/app/app.router.dart';
import 'package:blogify/extensions/string_extensions.dart';
import 'package:blogify/extensions/widget_extensions.dart';
import 'package:blogify/localization/locale_keys.g.dart';
import 'package:blogify/models/request/auth/sign_up_request.dart';
import 'package:blogify/ui/components/buttons/app_button.dart';
import 'package:blogify/ui/components/inputs/app_text_field.dart';
import 'package:blogify/ui/styles/spaces.dart';
import 'package:blogify/ui/views/sign_up/sign_up_form_helper.dart';
import 'package:blogify/ui/widgets/common/base_app_bar/base_app_bar.dart';
import 'package:blogify/ui/widgets/common/base_view_skeleton/base_view_skeleton.dart';
import 'package:blogify/ui/widgets/common/locale_text/locale_text.dart';
import 'package:blogify/utilities/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'sign_up_viewmodel.dart';

class SignUpView extends StackedView<SignUpViewModel> with SignUpFormHelper {
  SignUpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignUpViewModel viewModel,
    Widget? child,
  ) {
    return BaseViewSkeleton(
      appBar: BaseAppBar(
        title: LocaleKeys.singUp,
        actions: [
          TextButton(
            onPressed: viewModel.navigationService.navigateToSignInView,
            child: LocaleText(
              LocaleKeys.singIn,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
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
                controller: fullNameController,
                hintText: LocaleKeys.fullName,
                validator: Validators.validatefullName,
              ),
              AppTextFormField(
                controller: emailController,
                hintText: LocaleKeys.email,
                validator: Validators.validateEmail,
              ),
              AppTextFormField(
                controller: passwordController,
                hintText: LocaleKeys.password,
                validator: Validators.validatePassword,
                obscureText: viewModel.obscurePassword,
                suffix: TextButton(onPressed: () => viewModel.setObscurePassword(!viewModel.obscurePassword), child: LocaleText(LocaleKeys.show)),
              ),
              AppTextFormField(
                controller: confirmPasswordController,
                hintText: LocaleKeys.password,
                validator: (val) => Validators.validateConfirmPassword(val, passwordController.text),
                obscureText: viewModel.obscureConfirmPassword,
                suffix: TextButton(onPressed: () => viewModel.setObscureConfirmPassword(!viewModel.obscureConfirmPassword), child: LocaleText(LocaleKeys.show)),
              ),
              AppTextFormField(
                controller: birthdateController,
                hintText: LocaleKeys.birthdate,
                validator: Validators.validateBirthdate,
              ),
              Spaces.verticalSpaceMedium,
              AppButton.primary(
                  context: context,
                  label: LocaleKeys.singUp.locale,
                  onPressed: () {
                    SignUpRequest? request = validateForm();
                    if (request != null) viewModel.signUp(request: request);
                  }),
              TextButton(onPressed: () {}, child: LocaleText(LocaleKeys.forgotYourPassword)),
            ],
          ).p16h,
        ),
      ),
    );
  }

  @override
  SignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignUpViewModel();
  @override
  void onDispose(SignUpViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
