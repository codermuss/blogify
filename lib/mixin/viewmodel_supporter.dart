import 'dart:developer';

import 'package:blogify/app/app.locator.dart';
import 'package:flutter/foundation.dart';
import 'package:i_toast/i_toast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../models/base/base_response.dart';
import '../models/base/view_state.dart';

mixin ViewModelSupporter on BaseViewModel {
  /// MARK: - [Dependencies]
  final DialogService dialogService = locator<DialogService>();
  final BottomSheetService bottomSheetService = locator<BottomSheetService>();

  /// MARK: - [Properties]

  //* NOTE(mustafayilmazdev):
  /// {'cardsReference': ViewState.busy()}
  /// {'cardsReference': ViewState.data(List<Cards> cards)}
  /// {'spendingPoints': ViewState.error('error')}
  /// {'topMenu':ViewState.busy()}
  final Map<String, ViewState> _states = {};

  /// MARK: - [Getters & Setters]

  /// MARK: - [Initializer]

  /// MARK: - [Reset]

  /// MARK: - [Methods]

  // Future<T?> showLoading<T>() {
  //   BuildContext? context = StackedService.navigatorKey?.currentContext;
  //   if (context) {
  //     return showDialog<T>(
  //       barrierDismissible: false,
  //       context: StackedService.navigatorKey!.currentContext!,
  //       routeSettings: const RouteSettings(name: AppStrings.loadingRoute),
  //       builder: (BuildContext context) => Dialog(
  //         backgroundColor: Colors.transparent,
  //         elevation: .0,
  //         child: PopScope(
  //           canPop: false,
  //           child: Center(
  //             child: Assets.lottie.loading.show(height: 100.h),
  //           ),
  //         ),
  //       ),
  //     );
  //   } else {
  //     return Future.value(null);
  //   }
  // }

  // Future<T?> runLoadingFuture<T>(Future<BaseResponse<T>> Function() request) async {
  //   showLoading();
  //   try {
  //     return tryCreateModel(await request());
  //   } catch (e) {
  //     'e:$e'.appLog;
  //     rethrow;
  //   } finally {
  //     StackedService.navigatorKey?.currentState?.pop();
  //   }
  // }

  // Future<void> runLoadingVoid(Future<void> Function() request) async {
  //   showLoading();
  //   try {
  //     await request.call();
  //   } catch (e) {
  //     'e:$e'.appLog;
  //     rethrow;
  //   } finally {
  //     StackedService.navigatorKey?.currentState?.pop();
  //   }
  // }

  // Future<T?> runFuture<T>(Future<BaseResponse<T>> busyFuture, {Object? busyObject, bool throwException = false}) async {
  //   try {
  //     return tryCreateModel(await busyFuture);
  //   } catch (e) {
  //     'e:$e'.appLog;
  //     rethrow;
  //   }
  // }

  T? tryCreateModel<T>(BaseResponse<T> response) {
    T? model;
    response.when(
      success: (T data, ResponseMessageModel? message) {
        model = data;
        if (message != null) {
          IToastService.show(
            StackedService.navigatorKey!.currentContext!,
            title: '''LocaleKeys.iToastTitles_successTitle.locale''',
            description: message.text,
            toastType: ToastType.warning,
          );
        }
      },
      error: (ResponseMessageModel? errorData) {
        if (errorData != null) {
          IToastService.show(
            StackedService.navigatorKey!.currentContext!,
            title: 'LocaleKeys.iToastTitles_errorTitle.locale',
            description: errorData.text,
            toastType: ToastType.warning,
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
            title: 'LocaleKeys.iToastTitles_warningTitle.locale',
            description: message.text,
            toastType: ToastType.warning,
          );
        }
      },
    );
    return model;
  }

  // void showToast({String? title, required String description, required ToastType toastType}) {
  //   BuildContext? context = StackedService.navigatorKey?.currentContext;
  //   if (context.isNotNull) {
  //     IToastService.show(
  //       context!,
  //       title: title ?? toastType.title,
  //       description: description,
  //       toastType: toastType,
  //     );
  //   }
  // }

  //* NOTE(mustafayilmazdev):  Returns the view state for a specific object.
  //* NOTE(mustafayilmazdev):  If the state is not found, it defaults to BusyState.
  ViewState getStateForObject<T>(String reference) {
    return _states[reference] ?? ViewState.busy();
  }

  //* NOTE(mustafayilmazdev): Returns the model according to the given reference
  T? getModel<T>(String reference) {
    return _states[reference]?.whenOrNull(
      data: (data) {
        return data;
      },
    );
  }

  //* NOTE(mustafayilmazdev):  Sets the view state for a specific object and notifies listeners.
  void setStateForObject<T>(String reference, ViewState viewState) {
    _states[reference] = viewState;
    notifyListeners();
  }

  //* NOTE(mustafayilmazdev): Use only while feeding the  view
  //* NOTE(mustafayilmazdev): Handles an asynchronous request and updates the view state accordingly.
  Future<T?> handleViewStateByRequest<T>(String reference, Future<BaseResponse<T>> Function() request) async {
    T? model;
    try {
      setStateForObject(reference, const BusyState());
      await request.call().then(
            //* NOTE(mustafayilmazdev): Request complete
            (BaseResponse<T> response) => response.when(
              //* NOTE(mustafayilmazdev): Success Data State
              success: (data, message) {
                model = data;
                if (data is List && data.isEmpty) {
                  //* NOTE(mustafayilmazdev): If data is list and empty
                  setStateForObject(reference, const EmptyState());
                } else {
                  setStateForObject(reference, DataState<T>(data));
                }
                if (message != null && StackedService.navigatorKey!.currentContext != null) {
                  IToastService.show(
                    StackedService.navigatorKey!.currentContext!,
                    title: 'LocaleKeys.iToastTitles_successTitle.locale',
                    description: message.text,
                    toastType: ToastType.warning,
                  );
                }
              },
              //* NOTE(mustafayilmazdev): 206 and Message -> Empty State
              //* NOTE(mustafayilmazdev): Probably won't be necessary
              noContent: (message) {
                setStateForObject(reference, const EmptyState());
                if (message != null && StackedService.navigatorKey!.currentContext != null) {
                  IToastService.show(
                    StackedService.navigatorKey!.currentContext!,
                    title: 'LocaleKeys.iToastTitles_warningTitle.locale',
                    description: message.text,
                    toastType: ToastType.warning,
                  );
                }
              },
              //* NOTE(mustafayilmazdev): Error State
              error: (ResponseMessageModel? error) {
                setStateForObject(reference, ErrorState(error?.text ?? ''));
                if (StackedService.navigatorKey!.currentContext != null && error != null) {
                  IToastService.show(
                    StackedService.navigatorKey!.currentContext!,
                    title: 'LocaleKeys.iToastTitles_errorTitle.locale',
                    description: error.text,
                    toastType: ToastType.warning,
                  );
                }
              },
            ),
          );
    } catch (error) {
      //* NOTE(mustafayilmazdev): Error State
      setStateForObject(reference, ErrorState(error.toString()));
    }
    return model;
  }

  void clearStates() => _states.clear();
}
