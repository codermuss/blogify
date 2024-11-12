import 'package:blogify/app/app.locator.dart';
import 'package:blogify/services/app/view_model_helper_service.dart';
import 'package:i_toast/i_toast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../interfaces/i_storage_service.dart';
import '../models/base/base_response.dart';
import '../models/base/view_state.dart';

mixin ViewModelSupporter on BaseViewModel {
  /// MARK: - [Dependencies]

  final ViewModelHelperService _helperService = locator<ViewModelHelperService>();

  IStorageService get storageService => _helperService.storageService;
  BottomSheetService get bottomSheetService => _helperService.bottomSheetService;
  NavigationService get navigationService => _helperService.navigationService;
  DialogService get dialogService => _helperService.dialogService;

  Future<T?> showLoading<T>() => _helperService.showLoading<T>();

  Future<T?> runLoadingFuture<T>(Future<BaseResponse<T>> Function() request) => _helperService.runLoadingFuture(request, notifyListeners);

  Future<void> runLoadingVoid(Future<void> Function() request) => _helperService.runLoadingVoid(request);

  T? tryCreateModel<T>(BaseResponse<T> response) => _helperService.tryCreateModel(response, notifyListeners);

  void showToast({String? title, required String description, required ToastType toastType}) =>
      _helperService.showToast(title: title, description: description, toastType: toastType);

  ViewState getStateForObject(String reference) => _helperService.getStateForObject(reference);

  T? getModel<T>(String reference) => _helperService.getModel<T>(reference);

  void setStateForObject<T>(String reference, ViewState viewState) => _helperService.setStateForObject(reference, viewState, notifyListeners);

  Future<T?> handleViewStateByRequest<T>(String reference, Future<BaseResponse<T>> Function() request) =>
      _helperService.handleViewStateByRequest(reference, request, notifyListeners);

  void clearStates() => _helperService.clearStates();

  T? createRequestModel<T>(T? Function() validate) => _helperService.createRequestModel(validate);
}
