// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:blogify/ui/views/home/home_view.dart' as _i2;
import 'package:blogify/ui/views/onboarding/onboarding_view.dart' as _i5;
import 'package:blogify/ui/views/sign_in/sign_in_view.dart' as _i6;
import 'package:blogify/ui/views/sign_up/sign_up_view.dart' as _i4;
import 'package:blogify/ui/views/startup/startup_view.dart' as _i3;
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const signUpView = '/sign-up-view';

  static const onboardingView = '/onboarding-view';

  static const signInView = '/sign-in-view';

  static const all = <String>{
    homeView,
    startupView,
    signUpView,
    onboardingView,
    signInView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.signUpView,
      page: _i4.SignUpView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i5.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.signInView,
      page: _i6.SignInView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.SignUpView: (data) {
      final args = data.getArgs<SignUpViewArguments>(
        orElse: () => const SignUpViewArguments(),
      );
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.SignUpView(key: args.key),
        settings: data,
      );
    },
    _i5.OnboardingView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.OnboardingView(),
        settings: data,
      );
    },
    _i6.SignInView: (data) {
      final args = data.getArgs<SignInViewArguments>(
        orElse: () => const SignInViewArguments(),
      );
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.SignInView(key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class SignUpViewArguments {
  const SignUpViewArguments({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SignUpViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SignInViewArguments {
  const SignInViewArguments({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SignInViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView, id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView, id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> navigateToSignUpView({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  }) async {
    return navigateTo<dynamic>(Routes.signUpView,
        arguments: SignUpViewArguments(key: key), id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView, id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> navigateToSignInView({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  }) async {
    return navigateTo<dynamic>(Routes.signInView,
        arguments: SignInViewArguments(key: key), id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView, id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView, id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> replaceWithSignUpView({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  }) async {
    return replaceWith<dynamic>(Routes.signUpView,
        arguments: SignUpViewArguments(key: key), id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> replaceWithOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingView, id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> replaceWithSignInView({
    _i7.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  }) async {
    return replaceWith<dynamic>(Routes.signInView,
        arguments: SignInViewArguments(key: key), id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }
}
