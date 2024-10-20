import 'package:blogify/localization/locales.dart';
import 'package:blogify/utilities/constants/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' show Locale;

final class AppLocalization extends EasyLocalization {
  AppLocalization({super.key, required super.child})
      : super(
          supportedLocales: [Locales.tr.locale, Locales.en.locale],
          fallbackLocale: const Locale('en'),
          path: AppStrings.languageAssetPath,
          useOnlyLangCode: true,
        );
}
