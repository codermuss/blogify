import 'package:blogify/utilities/constants/app_strings.dart';
import 'package:flutter/material.dart';

enum Locales {
  en(Locale(AppStrings.en)),
  tr(Locale(AppStrings.tr));

  final Locale locale;
  const Locales(this.locale);
}
