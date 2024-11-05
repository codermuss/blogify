import 'dart:developer';

import 'package:blogify/app/app.locator.dart';
import 'package:blogify/extensions/string_extensions.dart';
import 'package:blogify/interfaces/i_storage_service.dart';
import 'package:blogify/services/app/hive_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:i_toast/i_toast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../localization/locale_keys.g.dart';
import '../models/base/base_response.dart';
import '../models/base/view_state.dart';
import '../utilities/constants/app_strings.dart';

mixin ViewModelSupporter on BaseViewModel {
  /// MARK: - [Dependencies]
  final DialogService dialogService = locator<DialogService>();
  final BottomSheetService bottomSheetService = locator<BottomSheetService>();
  final NavigationService navigationService = locator<NavigationService>();
  final IStorageService storageService = locator<HiveStorageService>();

  /// MARK: - [Properties]
  final Map<String, ViewState> _states = {};

  /// MARK: - [Getters & Setters]

  /// MARK: - [Initializer]

  /// MARK: - [Reset]

  /// MARK: - [Methods]

  Future<T?> showLoading<T>() {
    BuildContext? context = StackedService.navigatorKey?.currentContext;
    if (context != null) {
      return showDialog<T>(
        barrierDismissible: false,
        context: StackedService.navigatorKey!.currentContext!,
        routeSettings: const RouteSettings(name: AppStrings.loadingRoute),
        builder: (BuildContext context) => const Dialog(
          backgroundColor: Colors.transparent,
          elevation: .0,
          child: PopScope(
            canPop: false,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
    } else {
      return Future.value(null);
    }
  }

  Future<T?> runLoadingFuture<T>(Future<BaseResponse<T>> Function() request) async {
    showLoading();
    try {
      return tryCreateModel(await request());
    } catch (e) {
      rethrow;
    } finally {
      StackedService.navigatorKey?.currentState?.pop();
    }
  }

  Future<void> runLoadingVoid(Future<void> Function() request) async {
    showLoading();
    try {
      await request.call();
    } catch (e) {
      rethrow;
    } finally {
      StackedService.navigatorKey?.currentState?.pop();
    }
  }

  Future<T?> runFuture<T>(Future<BaseResponse<T>> busyFuture, {Object? busyObject, bool throwException = false}) async {
    try {
      return tryCreateModel(await busyFuture);
    } catch (e) {
      rethrow;
    }
  }

  T? tryCreateModel<T>(BaseResponse<T> response) {
    T? model;
    response.when(
      success: (T data, ResponseMessageModel? message) {
        model = data;
        if (message != null) {
          IToastService.show(
            StackedService.navigatorKey!.currentContext!,
            title: LocaleKeys.iToastTitles_success.locale,
            description: message.text,
            toastType: ToastType.success,
          );
        }
      },
      error: (ResponseMessageModel? errorData) {
        if (errorData != null) {
          IToastService.show(
            StackedService.navigatorKey!.currentContext!,
            title: LocaleKeys.iToastTitles_error.locale,
            description: errorData.text,
            toastType: ToastType.error,
          );
          if (kDebugMode) {
            log('errorData: ${errorData.text}');
          }
        }
      },
      noContent: (ResponseMessageModel? message) {
        if (message != null) {
          IToastService.show(
            StackedService.navigatorKey!.currentContext!,
            title: LocaleKeys.iToastTitles_warning.locale,
            description: message.text,
            toastType: ToastType.warning,
          );
        }
      },
    );
    return model;
  }

  void showToast({String? title, required String description, required ToastType toastType}) {
    BuildContext? context = StackedService.navigatorKey?.currentContext;
    if (context != null) {
      IToastService.show(
        context,
        title: title ?? '',
        description: description,
        toastType: toastType,
      );
    }
  }

  ViewState getStateForObject<T>(String reference) {
    return _states[reference] ?? ViewState.busy();
  }

  T? getModel<T>(String reference) {
    return _states[reference]?.whenOrNull(
      data: (data) {
        return data;
      },
    );
  }

  void setStateForObject<T>(String reference, ViewState viewState) {
    _states[reference] = viewState;
    notifyListeners();
  }

  Future<T?> handleViewStateByRequest<T>(String reference, Future<BaseResponse<T>> Function() request) async {
    T? model;
    try {
      setStateForObject(reference, const BusyState());
      await request.call().then(
            (BaseResponse<T> response) => response.when(
              success: (data, message) {
                model = data;
                if (data is List && data.isEmpty) {
                  setStateForObject(reference, const EmptyState());
                } else {
                  setStateForObject(reference, DataState<T>(data));
                }
                if (message != null && StackedService.navigatorKey!.currentContext != null) {
                  IToastService.show(
                    StackedService.navigatorKey!.currentContext!,
                    title: LocaleKeys.iToastTitles_success.locale,
                    description: message.text,
                    toastType: ToastType.success,
                  );
                }
              },
              noContent: (message) {
                setStateForObject(reference, const EmptyState());
                if (message != null && StackedService.navigatorKey!.currentContext != null) {
                  IToastService.show(
                    StackedService.navigatorKey!.currentContext!,
                    title: LocaleKeys.iToastTitles_warning.locale,
                    description: message.text,
                    toastType: ToastType.warning,
                  );
                }
              },
              error: (ResponseMessageModel? error) {
                setStateForObject(reference, ErrorState(error?.text ?? ''));
                if (StackedService.navigatorKey!.currentContext != null && error != null) {
                  IToastService.show(
                    StackedService.navigatorKey!.currentContext!,
                    title: LocaleKeys.iToastTitles_error.locale,
                    description: error.text,
                    toastType: ToastType.warning,
                  );
                }
              },
            ),
          );
    } catch (error) {
      setStateForObject(reference, ErrorState(error.toString()));
    }
    return model;
  }

  void clearStates() => _states.clear();
  T? createRequestModel<T>(T? Function() validate) {
    T? val = validate();
    if (val == null) showToast(title: 'Warning', description: 'Check fields', toastType: ToastType.warning);
    return val;
  }
}
