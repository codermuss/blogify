import 'package:blogify/extensions/string_extensions.dart';

import '../../localization/locale_keys.g.dart';

class Validators {
  // Name validator
  static String? validatefullName(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validators_nameRequired.locale;
    }
    if (value.length < 2) {
      return LocaleKeys.validators_nameLength.locale;
    }
    return null;
  }

  static String? validateuserame(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validators_usernameRequired.locale;
    }
    if (value.length < 2) {
      return LocaleKeys.validators_usernameLength.locale;
    }
    return null;
  }

  // Email validator
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validators_emailRequired.locale;
    }

    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return LocaleKeys.validators_emailInvalid.locale;
    }

    return null;
  }

  // Password validator
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validators_passwordRequired.locale;
    }

    if (value.length < 6) {
      return LocaleKeys.validators_passwordLength.locale;
    }

    return null;
  }

  // Confirm password validator
  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return LocaleKeys.validators_confirmPasswordRequired.locale;
    }

    if (password != confirmPassword) {
      return LocaleKeys.validators_passwordsDoNotMatch.locale;
    }

    return null;
  }

  // Birthdate validator
  static String? validateBirthdate(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validators_birthdateRequired.locale;
    }

    final birthdateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!birthdateRegex.hasMatch(value)) {
      return LocaleKeys.validators_birthdateInvalid.locale;
    }

    final birthDate = DateTime.parse(value);
    final age = DateTime.now().year - birthDate.year;
    if (age < 13) {
      return LocaleKeys.validators_birthdateAge.locale;
    }

    return null;
  }
}
