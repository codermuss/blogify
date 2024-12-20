import 'package:easy_localization/easy_localization.dart';

extension LanguageExtensions on String {
  String get locale => this.tr();
  String localeArgs(List<String> args) => this.tr(args: args);
}
