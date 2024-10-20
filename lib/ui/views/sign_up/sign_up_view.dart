import 'package:blogify/extensions/widget_extensions.dart';
import 'package:blogify/localization/locale_keys.g.dart';
import 'package:blogify/localization/locales.dart';
import 'package:blogify/ui/components/buttons/app_button.dart';
import 'package:blogify/ui/components/inputs/app_text_field.dart';
import 'package:blogify/ui/components/inputs/checkbox/checkbox_form_field.dart';
import 'package:blogify/ui/components/inputs/checkbox/checkbox_form_item.dart';
import 'package:blogify/ui/styles/spaces.dart';
import 'package:blogify/ui/widgets/common/base_app_bar/base_app_bar.dart';
import 'package:blogify/ui/widgets/common/base_view_skeleton/base_view_skeleton.dart';
import 'package:blogify/ui/widgets/common/locale_text/locale_text.dart';
import 'package:easy_localization/easy_localization.dart';
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
        title: LocaleKeys.singUp,
        actions: [
          TextButton(
            onPressed: () {},
            child: LocaleText(
              LocaleKeys.singIn,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spaces.verticalSpaceMedium,
            AppTextFormField(
              controller: TextEditingController(),
              hintText: LocaleKeys.name,
            ),
            AppTextFormField(
              controller: TextEditingController(),
              hintText: LocaleKeys.email,
            ),
            AppTextFormField(
              controller: TextEditingController(),
              hintText: LocaleKeys.password,
              obscureText: true,
              suffix: TextButton(onPressed: () {}, child: LocaleText(LocaleKeys.show)),
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
            TextButton(onPressed: () {}, child: LocaleText(LocaleKeys.forgotYourPassword)),
            AppButton.primary(
                context: context,
                label: LocaleKeys.name.tr(),
                onPressed: () async {
                  await context.setLocale(context.locale == Locales.tr.locale ? const Locale('en') : const Locale('tr'));
                }),
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
