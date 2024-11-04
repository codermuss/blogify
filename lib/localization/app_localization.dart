import 'package:blogify/localization/locales.dart';
import 'package:blogify/utilities/constants/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';

final class AppLocalization extends EasyLocalization {
  AppLocalization({super.key, required super.child})
      : super(
          supportedLocales: [Locales.tr.locale, Locales.en.locale],
          startLocale: Locales.tr.locale,
          fallbackLocale: Locales.tr.locale,
          path: AppStrings.languageAssetPath,
          useOnlyLangCode: true,
        );
}
