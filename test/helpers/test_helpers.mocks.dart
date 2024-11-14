// Mocks generated by Mockito 5.4.4 from annotations
// in blogify/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:ui' as _i9;

import 'package:blogify/interfaces/i_storage_service.dart' as _i5;
import 'package:blogify/models/base/base_response.dart' as _i3;
import 'package:blogify/models/base/view_state.dart' as _i6;
import 'package:blogify/models/request/auth/sign_in_request.dart' as _i19;
import 'package:blogify/models/request/auth/sign_up_request.dart' as _i17;
import 'package:blogify/models/response/auth/sign_in_response.dart' as _i18;
import 'package:blogify/models/response/auth/sign_up_response.dart' as _i16;
import 'package:blogify/models/response/onboarding/onboarding.dart' as _i14;
import 'package:blogify/network/clients/dio/dio_http_client.dart' as _i13;
import 'package:blogify/services/api/auth_api_service.dart' as _i15;
import 'package:blogify/services/api/onboarding_api_service.dart' as _i12;
import 'package:blogify/services/app/encryption_service.dart' as _i21;
import 'package:blogify/services/app/hive_storage_service.dart' as _i20;
import 'package:blogify/services/app/theme_service.dart' as _i10;
import 'package:blogify/services/app/view_model_helper_service.dart' as _i22;
import 'package:blogify/ui/themes/theme_modes.dart' as _i11;
import 'package:flutter/material.dart' as _i2;
import 'package:i_toast/i_toast.dart' as _i23;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;
import 'package:stacked_services/stacked_services.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeThemeData_0 extends _i1.SmartFake implements _i2.ThemeData {
  _FakeThemeData_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i2.DiagnosticLevel? minLevel = _i2.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeBaseResponse_1<T> extends _i1.SmartFake
    implements _i3.BaseResponse<T> {
  _FakeBaseResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDialogService_2 extends _i1.SmartFake implements _i4.DialogService {
  _FakeDialogService_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBottomSheetService_3 extends _i1.SmartFake
    implements _i4.BottomSheetService {
  _FakeBottomSheetService_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNavigationService_4 extends _i1.SmartFake
    implements _i4.NavigationService {
  _FakeNavigationService_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIStorageService_5 extends _i1.SmartFake
    implements _i5.IStorageService {
  _FakeIStorageService_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeViewState_6<T> extends _i1.SmartFake implements _i6.ViewState<T> {
  _FakeViewState_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i4.NavigationService {
  @override
  String get previousRoute => (super.noSuchMethod(
        Invocation.getter(#previousRoute),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#previousRoute),
        ),
        returnValueForMissingStub: _i7.dummyValue<String>(
          this,
          Invocation.getter(#previousRoute),
        ),
      ) as String);

  @override
  String get currentRoute => (super.noSuchMethod(
        Invocation.getter(#currentRoute),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.getter(#currentRoute),
        ),
        returnValueForMissingStub: _i7.dummyValue<String>(
          this,
          Invocation.getter(#currentRoute),
        ),
      ) as String);

  @override
  _i2.GlobalKey<_i2.NavigatorState>? nestedNavigationKey(int? index) =>
      (super.noSuchMethod(
        Invocation.method(
          #nestedNavigationKey,
          [index],
        ),
        returnValueForMissingStub: null,
      ) as _i2.GlobalKey<_i2.NavigatorState>?);

  @override
  void config({
    bool? enableLog,
    bool? defaultPopGesture,
    bool? defaultOpaqueRoute,
    Duration? defaultDurationTransition,
    bool? defaultGlobalState,
    _i4.Transition? defaultTransitionStyle,
    String? defaultTransition,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #config,
          [],
          {
            #enableLog: enableLog,
            #defaultPopGesture: defaultPopGesture,
            #defaultOpaqueRoute: defaultOpaqueRoute,
            #defaultDurationTransition: defaultDurationTransition,
            #defaultGlobalState: defaultGlobalState,
            #defaultTransitionStyle: defaultTransitionStyle,
            #defaultTransition: defaultTransition,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<T?>? navigateWithTransition<T>(
    _i2.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i2.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i4.Transition? transitionClass,
    _i4.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);

  @override
  _i8.Future<T?>? replaceWithTransition<T>(
    _i2.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i2.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i4.Transition? transitionClass,
    _i4.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);

  @override
  bool back<T>({
    dynamic result,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #back,
          [],
          {
            #result: result,
            #id: id,
          },
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  void popUntil(
    _i2.RoutePredicate? predicate, {
    int? id,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
          {#id: id},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void popRepeated(int? popTimes) => super.noSuchMethod(
        Invocation.method(
          #popRepeated,
          [popTimes],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<T?>? navigateTo<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i2.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateTo,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);

  @override
  _i8.Future<T?>? navigateToView<T>(
    _i2.Widget? view, {
    dynamic arguments,
    int? id,
    bool? opaque,
    _i2.Curve? curve,
    Duration? duration,
    bool? fullscreenDialog = false,
    bool? popGesture,
    bool? preventDuplicates = true,
    _i4.Transition? transition,
    _i4.Transition? transitionStyle,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateToView,
          [view],
          {
            #arguments: arguments,
            #id: id,
            #opaque: opaque,
            #curve: curve,
            #duration: duration,
            #fullscreenDialog: fullscreenDialog,
            #popGesture: popGesture,
            #preventDuplicates: preventDuplicates,
            #transition: transition,
            #transitionStyle: transitionStyle,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);

  @override
  _i8.Future<T?>? replaceWith<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i2.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWith,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);

  @override
  _i8.Future<T?>? clearStackAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);

  @override
  _i8.Future<T?>? clearStackAndShowView<T>(
    _i2.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);

  @override
  _i8.Future<T?>? clearTillFirstAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);

  @override
  _i8.Future<T?>? clearTillFirstAndShowView<T>(
    _i2.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);

  @override
  _i8.Future<T?>? pushNamedAndRemoveUntil<T>(
    String? routeName, {
    _i2.RoutePredicate? predicate,
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamedAndRemoveUntil,
          [routeName],
          {
            #predicate: predicate,
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i8.Future<T?>?);
}

/// A class which mocks [BottomSheetService].
///
/// See the documentation for Mockito's code generation for more information.
class MockBottomSheetService extends _i1.Mock
    implements _i4.BottomSheetService {
  @override
  void setCustomSheetBuilders(Map<dynamic, _i4.SheetBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #setCustomSheetBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<_i4.SheetResponse<dynamic>?> showBottomSheet({
    required String? title,
    String? description,
    String? confirmButtonTitle = r'Ok',
    String? cancelButtonTitle,
    bool? enableDrag = true,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
    double? elevation = 1.0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showBottomSheet,
          [],
          {
            #title: title,
            #description: description,
            #confirmButtonTitle: confirmButtonTitle,
            #cancelButtonTitle: cancelButtonTitle,
            #enableDrag: enableDrag,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
            #elevation: elevation,
          },
        ),
        returnValue: _i8.Future<_i4.SheetResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i8.Future<_i4.SheetResponse<dynamic>?>.value(),
      ) as _i8.Future<_i4.SheetResponse<dynamic>?>);

  @override
  _i8.Future<_i4.SheetResponse<T>?> showCustomSheet<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i9.Color? barrierColor = const _i9.Color(2315255808),
    double? elevation = 1.0,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
    bool? enableDrag = true,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSheet,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #elevation: elevation,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
            #enableDrag: enableDrag,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i8.Future<_i4.SheetResponse<T>?>.value(),
        returnValueForMissingStub: _i8.Future<_i4.SheetResponse<T>?>.value(),
      ) as _i8.Future<_i4.SheetResponse<T>?>);

  @override
  void completeSheet(_i4.SheetResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeSheet,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i4.DialogService {
  @override
  void registerCustomDialogBuilders(
          Map<dynamic, _i4.DialogBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void registerCustomDialogBuilder({
    required dynamic variant,
    required _i2.Widget Function(
      _i2.BuildContext,
      _i4.DialogRequest<dynamic>,
      dynamic Function(_i4.DialogResponse<dynamic>),
    )? builder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilder,
          [],
          {
            #variant: variant,
            #builder: builder,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<_i4.DialogResponse<dynamic>?> showDialog({
    String? title,
    String? description,
    String? cancelTitle,
    _i9.Color? cancelTitleColor,
    String? buttonTitle = r'Ok',
    _i9.Color? buttonTitleColor,
    bool? barrierDismissible = false,
    _i4.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #buttonTitle: buttonTitle,
            #buttonTitleColor: buttonTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i8.Future<_i4.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i8.Future<_i4.DialogResponse<dynamic>?>.value(),
      ) as _i8.Future<_i4.DialogResponse<dynamic>?>);

  @override
  _i8.Future<_i4.DialogResponse<T>?> showCustomDialog<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i9.Color? barrierColor = const _i9.Color(2315255808),
    bool? barrierDismissible = false,
    String? barrierLabel = r'',
    bool? useSafeArea = true,
    dynamic customData,
    R? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomDialog,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #barrierLabel: barrierLabel,
            #useSafeArea: useSafeArea,
            #customData: customData,
            #data: data,
          },
        ),
        returnValue: _i8.Future<_i4.DialogResponse<T>?>.value(),
        returnValueForMissingStub: _i8.Future<_i4.DialogResponse<T>?>.value(),
      ) as _i8.Future<_i4.DialogResponse<T>?>);

  @override
  _i8.Future<_i4.DialogResponse<dynamic>?> showConfirmationDialog({
    String? title,
    String? description,
    String? cancelTitle = r'Cancel',
    _i9.Color? cancelTitleColor,
    String? confirmationTitle = r'Ok',
    _i9.Color? confirmationTitleColor,
    bool? barrierDismissible = false,
    _i4.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showConfirmationDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #confirmationTitle: confirmationTitle,
            #confirmationTitleColor: confirmationTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i8.Future<_i4.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i8.Future<_i4.DialogResponse<dynamic>?>.value(),
      ) as _i8.Future<_i4.DialogResponse<dynamic>?>);

  @override
  void completeDialog(_i4.DialogResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeDialog,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ThemeService].
///
/// See the documentation for Mockito's code generation for more information.
class MockThemeService extends _i1.Mock implements _i10.ThemeService {
  @override
  _i11.AppThemeMode get themeMode => (super.noSuchMethod(
        Invocation.getter(#themeMode),
        returnValue: _i11.AppThemeMode.light,
        returnValueForMissingStub: _i11.AppThemeMode.light,
      ) as _i11.AppThemeMode);

  @override
  _i2.ThemeData get theme => (super.noSuchMethod(
        Invocation.getter(#theme),
        returnValue: _FakeThemeData_0(
          this,
          Invocation.getter(#theme),
        ),
        returnValueForMissingStub: _FakeThemeData_0(
          this,
          Invocation.getter(#theme),
        ),
      ) as _i2.ThemeData);

  @override
  bool get isDarkMode => (super.noSuchMethod(
        Invocation.getter(#isDarkMode),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  int get listenersCount => (super.noSuchMethod(
        Invocation.getter(#listenersCount),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);

  @override
  void toggleTheme(_i11.AppThemeMode? mode) => super.noSuchMethod(
        Invocation.method(
          #toggleTheme,
          [mode],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void listenToReactiveValues(List<dynamic>? reactiveValues) =>
      super.noSuchMethod(
        Invocation.method(
          #listenToReactiveValues,
          [reactiveValues],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(void Function()? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(void Function()? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [OnboardingApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockOnboardingApiService extends _i1.Mock
    implements _i12.OnboardingApiService {
  @override
  _i13.DioHttpClient get dioHttpClient => (super.noSuchMethod(
        Invocation.getter(#dioHttpClient),
        returnValue: _i7.dummyValue<_i13.DioHttpClient>(
          this,
          Invocation.getter(#dioHttpClient),
        ),
        returnValueForMissingStub: _i7.dummyValue<_i13.DioHttpClient>(
          this,
          Invocation.getter(#dioHttpClient),
        ),
      ) as _i13.DioHttpClient);

  @override
  _i8.Future<_i3.BaseResponse<List<_i14.Onboarding>?>> getOnboarding() =>
      (super.noSuchMethod(
        Invocation.method(
          #getOnboarding,
          [],
        ),
        returnValue: _i8.Future<_i3.BaseResponse<List<_i14.Onboarding>?>>.value(
            _FakeBaseResponse_1<List<_i14.Onboarding>?>(
          this,
          Invocation.method(
            #getOnboarding,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i3.BaseResponse<List<_i14.Onboarding>?>>.value(
                _FakeBaseResponse_1<List<_i14.Onboarding>?>(
          this,
          Invocation.method(
            #getOnboarding,
            [],
          ),
        )),
      ) as _i8.Future<_i3.BaseResponse<List<_i14.Onboarding>?>>);
}

/// A class which mocks [AuthApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthApiService extends _i1.Mock implements _i15.AuthApiService {
  @override
  _i13.DioHttpClient get dioHttpClient => (super.noSuchMethod(
        Invocation.getter(#dioHttpClient),
        returnValue: _i7.dummyValue<_i13.DioHttpClient>(
          this,
          Invocation.getter(#dioHttpClient),
        ),
        returnValueForMissingStub: _i7.dummyValue<_i13.DioHttpClient>(
          this,
          Invocation.getter(#dioHttpClient),
        ),
      ) as _i13.DioHttpClient);

  @override
  _i8.Future<_i3.BaseResponse<_i16.SignUpResponse>> signUp(
          {required _i17.SignUpRequest? request}) =>
      (super.noSuchMethod(
        Invocation.method(
          #signUp,
          [],
          {#request: request},
        ),
        returnValue: _i8.Future<_i3.BaseResponse<_i16.SignUpResponse>>.value(
            _FakeBaseResponse_1<_i16.SignUpResponse>(
          this,
          Invocation.method(
            #signUp,
            [],
            {#request: request},
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i3.BaseResponse<_i16.SignUpResponse>>.value(
                _FakeBaseResponse_1<_i16.SignUpResponse>(
          this,
          Invocation.method(
            #signUp,
            [],
            {#request: request},
          ),
        )),
      ) as _i8.Future<_i3.BaseResponse<_i16.SignUpResponse>>);

  @override
  _i8.Future<_i3.BaseResponse<_i18.SignInResponse>> signIn(
          {required _i19.SignInRequest? request}) =>
      (super.noSuchMethod(
        Invocation.method(
          #signIn,
          [],
          {#request: request},
        ),
        returnValue: _i8.Future<_i3.BaseResponse<_i18.SignInResponse>>.value(
            _FakeBaseResponse_1<_i18.SignInResponse>(
          this,
          Invocation.method(
            #signIn,
            [],
            {#request: request},
          ),
        )),
        returnValueForMissingStub:
            _i8.Future<_i3.BaseResponse<_i18.SignInResponse>>.value(
                _FakeBaseResponse_1<_i18.SignInResponse>(
          this,
          Invocation.method(
            #signIn,
            [],
            {#request: request},
          ),
        )),
      ) as _i8.Future<_i3.BaseResponse<_i18.SignInResponse>>);
}

/// A class which mocks [HiveStorageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockHiveStorageService extends _i1.Mock
    implements _i20.HiveStorageService {
  @override
  _i8.Future<void> init({String? path}) => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
          {#path: path},
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> saveData<T>(
    String? key,
    T? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveData,
          [
            key,
            value,
          ],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  T? getData<T>(String? key) => (super.noSuchMethod(
        Invocation.method(
          #getData,
          [key],
        ),
        returnValueForMissingStub: null,
      ) as T?);

  @override
  _i8.Future<void> deleteData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #deleteData,
          [key],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> clearAllData() => (super.noSuchMethod(
        Invocation.method(
          #clearAllData,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [EncryptionService].
///
/// See the documentation for Mockito's code generation for more information.
class MockEncryptionService extends _i1.Mock implements _i21.EncryptionService {
  @override
  String encrypt(String? data) => (super.noSuchMethod(
        Invocation.method(
          #encrypt,
          [data],
        ),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.method(
            #encrypt,
            [data],
          ),
        ),
        returnValueForMissingStub: _i7.dummyValue<String>(
          this,
          Invocation.method(
            #encrypt,
            [data],
          ),
        ),
      ) as String);

  @override
  String decrypt(String? encryptedData) => (super.noSuchMethod(
        Invocation.method(
          #decrypt,
          [encryptedData],
        ),
        returnValue: _i7.dummyValue<String>(
          this,
          Invocation.method(
            #decrypt,
            [encryptedData],
          ),
        ),
        returnValueForMissingStub: _i7.dummyValue<String>(
          this,
          Invocation.method(
            #decrypt,
            [encryptedData],
          ),
        ),
      ) as String);
}

/// A class which mocks [ViewModelHelperService].
///
/// See the documentation for Mockito's code generation for more information.
class MockViewModelHelperService extends _i1.Mock
    implements _i22.ViewModelHelperService {
  @override
  _i4.DialogService get dialogService => (super.noSuchMethod(
        Invocation.getter(#dialogService),
        returnValue: _FakeDialogService_2(
          this,
          Invocation.getter(#dialogService),
        ),
        returnValueForMissingStub: _FakeDialogService_2(
          this,
          Invocation.getter(#dialogService),
        ),
      ) as _i4.DialogService);

  @override
  _i4.BottomSheetService get bottomSheetService => (super.noSuchMethod(
        Invocation.getter(#bottomSheetService),
        returnValue: _FakeBottomSheetService_3(
          this,
          Invocation.getter(#bottomSheetService),
        ),
        returnValueForMissingStub: _FakeBottomSheetService_3(
          this,
          Invocation.getter(#bottomSheetService),
        ),
      ) as _i4.BottomSheetService);

  @override
  _i4.NavigationService get navigationService => (super.noSuchMethod(
        Invocation.getter(#navigationService),
        returnValue: _FakeNavigationService_4(
          this,
          Invocation.getter(#navigationService),
        ),
        returnValueForMissingStub: _FakeNavigationService_4(
          this,
          Invocation.getter(#navigationService),
        ),
      ) as _i4.NavigationService);

  @override
  _i5.IStorageService get storageService => (super.noSuchMethod(
        Invocation.getter(#storageService),
        returnValue: _FakeIStorageService_5(
          this,
          Invocation.getter(#storageService),
        ),
        returnValueForMissingStub: _FakeIStorageService_5(
          this,
          Invocation.getter(#storageService),
        ),
      ) as _i5.IStorageService);

  @override
  _i8.Future<T?> showLoading<T>() => (super.noSuchMethod(
        Invocation.method(
          #showLoading,
          [],
        ),
        returnValue: _i8.Future<T?>.value(),
        returnValueForMissingStub: _i8.Future<T?>.value(),
      ) as _i8.Future<T?>);

  @override
  _i8.Future<T?> runLoadingFuture<T>(
    _i8.Future<_i3.BaseResponse<T>> Function()? request,
    _i9.VoidCallback? notifyListeners,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #runLoadingFuture,
          [
            request,
            notifyListeners,
          ],
        ),
        returnValue: _i8.Future<T?>.value(),
        returnValueForMissingStub: _i8.Future<T?>.value(),
      ) as _i8.Future<T?>);

  @override
  _i8.Future<void> runLoadingVoid(_i8.Future<void> Function()? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #runLoadingVoid,
          [request],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  T? tryCreateModel<T>(
    _i3.BaseResponse<T>? response,
    _i9.VoidCallback? notifyListeners,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #tryCreateModel,
          [
            response,
            notifyListeners,
          ],
        ),
        returnValueForMissingStub: null,
      ) as T?);

  @override
  void showToast({
    String? title,
    required String? description,
    required _i23.ToastType? toastType,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #showToast,
          [],
          {
            #title: title,
            #description: description,
            #toastType: toastType,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.ViewState<dynamic> getStateForObject(String? reference) =>
      (super.noSuchMethod(
        Invocation.method(
          #getStateForObject,
          [reference],
        ),
        returnValue: _FakeViewState_6<dynamic>(
          this,
          Invocation.method(
            #getStateForObject,
            [reference],
          ),
        ),
        returnValueForMissingStub: _FakeViewState_6<dynamic>(
          this,
          Invocation.method(
            #getStateForObject,
            [reference],
          ),
        ),
      ) as _i6.ViewState<dynamic>);

  @override
  T? getModel<T>(String? reference) => (super.noSuchMethod(
        Invocation.method(
          #getModel,
          [reference],
        ),
        returnValueForMissingStub: null,
      ) as T?);

  @override
  void setStateForObject<T>(
    String? reference,
    _i6.ViewState<dynamic>? viewState,
    _i9.VoidCallback? notifyListeners,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #setStateForObject,
          [
            reference,
            viewState,
            notifyListeners,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<T?> handleViewStateByRequest<T>(
    String? reference,
    _i8.Future<_i3.BaseResponse<T>> Function()? request,
    _i9.VoidCallback? notifyListeners,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #handleViewStateByRequest,
          [
            reference,
            request,
            notifyListeners,
          ],
        ),
        returnValue: _i8.Future<T?>.value(),
        returnValueForMissingStub: _i8.Future<T?>.value(),
      ) as _i8.Future<T?>);

  @override
  void clearStates() => super.noSuchMethod(
        Invocation.method(
          #clearStates,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  T? createRequestModel<T>(T? Function()? validate) => (super.noSuchMethod(
        Invocation.method(
          #createRequestModel,
          [validate],
        ),
        returnValueForMissingStub: null,
      ) as T?);
}
