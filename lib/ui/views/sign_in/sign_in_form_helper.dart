import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../models/request/auth/sign_in_request.dart';

mixin SignInFormHelper on BaseViewModel {
  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  void disposeForm() {
    usernameController.dispose();
    passwordController.dispose();
  }

  void clearForm() {
    usernameController.clear();
    passwordController.clear();
  }

  SignInRequest? validateForm() => formKey.currentState!.validate() ? SignInRequest(username: usernameController.text, password: passwordController.text) : null;
}
