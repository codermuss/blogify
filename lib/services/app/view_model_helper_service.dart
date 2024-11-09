import 'dart:developer';

import 'package:blogify/app/app.locator.dart';
import 'package:blogify/extensions/string_extensions.dart';
import 'package:blogify/interfaces/i_storage_service.dart';
import 'package:blogify/localization/locale_keys.g.dart';
import 'package:blogify/models/base/base_response.dart';
import 'package:blogify/models/base/view_state.dart';
import 'package:blogify/services/app/hive_storage_service.dart';
import 'package:blogify/utilities/constants/app_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:i_toast/i_toast.dart';
import 'package:stacked_services/stacked_services.dart';

class ViewModelHelperService {
  final DialogService _dialogService = locator<DialogService>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final IStorageService _storageService = locator<HiveStorageService>();

  // Getters for testing
  DialogService get dialogService => _dialogService;
  BottomSheetService get bottomSheetService => _bottomSheetService;
  NavigationService get navigationService => _navigationService;
  IStorageService get storageService => _storageService;

  final Map<String, ViewState> _states = {};

  Future<T?> showLoading<T>() {
    BuildContext? context = StackedService.navigatorKey?.currentContext;
    if (context != null) {
      return showDialog<T>(
        barrierDismissible: false,
        context: context,
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
    }
    return Future.value(null);
  }

  Future<T?> runLoadingFuture<T>(
    Future<BaseResponse<T>> Function() request,
    VoidCallback notifyListeners,
  ) async {
    showLoading();
    try {
      return tryCreateModel(await request(), notifyListeners);
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

  T? tryCreateModel<T>(BaseResponse<T> response, VoidCallback notifyListeners) {
    T? model;
    response.when(
      success: (T data, ResponseMessageModel? message) {
        model = data;
        if (message != null) {
          showToast(
            title: LocaleKeys.iToastTitles_success.locale,
            description: message.text,
            toastType: ToastType.success,
          );
        }
      },
      error: (ResponseMessageModel? errorData) {
        if (errorData != null) {
          showToast(
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
          showToast(
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

  ViewState getStateForObject(String reference) {
    return _states[reference] ?? ViewState.busy();
  }

  T? getModel<T>(String reference) {
    return _states[reference]?.whenOrNull(
      data: (data) => data,
    );
  }

  void setStateForObject<T>(String reference, ViewState viewState, VoidCallback notifyListeners) {
    _states[reference] = viewState;
    notifyListeners();
  }

  Future<T?> handleViewStateByRequest<T>(
    String reference,
    Future<BaseResponse<T>> Function() request,
    VoidCallback notifyListeners,
  ) async {
    T? model;
    try {
      setStateForObject(reference, const BusyState(), notifyListeners);
      await request.call().then(
            (BaseResponse<T> response) => response.when(
              success: (data, message) {
                model = data;
                if (data is List && data.isEmpty) {
                  setStateForObject(reference, const EmptyState(), notifyListeners);
                } else {
                  setStateForObject(reference, DataState<T>(data), notifyListeners);
                }
                if (message != null && StackedService.navigatorKey?.currentContext != null) {
                  showToast(
                    title: LocaleKeys.iToastTitles_success.locale,
                    description: message.text,
                    toastType: ToastType.success,
                  );
                }
              },
              noContent: (message) {
                setStateForObject(reference, const EmptyState(), notifyListeners);
                if (message != null && StackedService.navigatorKey?.currentContext != null) {
                  showToast(
                    title: LocaleKeys.iToastTitles_warning.locale,
                    description: message.text,
                    toastType: ToastType.warning,
                  );
                }
              },
              error: (ResponseMessageModel? error) {
                setStateForObject(reference, ErrorState(error?.text ?? ''), notifyListeners);
                if (StackedService.navigatorKey?.currentContext != null && error != null) {
                  showToast(
                    title: LocaleKeys.iToastTitles_error.locale,
                    description: error.text,
                    toastType: ToastType.warning,
                  );
                }
              },
            ),
          );
    } catch (error) {
      setStateForObject(reference, ErrorState(error.toString()), notifyListeners);
    }
    return model;
  }

  void clearStates() => _states.clear();

  T? createRequestModel<T>(T? Function() validate) {
    T? val = validate();
    if (val == null) {
      showToast(
        title: 'Warning',
        description: 'Check fields',
        toastType: ToastType.warning,
      );
    }
    return val;
  }
}
