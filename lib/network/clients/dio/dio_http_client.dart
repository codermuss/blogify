import 'dart:io';

import 'package:blogify/network/interface/i_network_service.dart';
import 'package:dio/dio.dart';

import '../../../models/base/base_reques.dart';
import '../../../models/base/base_response.dart';
import '../../mixin/dio_http_client_mixin.dart';

final class DioHttpClient extends INetworkService with DioHttpClientMixin {
  DioHttpClient({
    required String baseUrl,
    Dio? dio,
    List<Interceptor>? customInterceptors,
    BaseOptions? baseOptions,
    bool enableLogging = true,
  }) {
    setupDio(
      baseUrl: baseUrl,
      customDio: dio,
      baseOptions: baseOptions,
      customInterceptors: customInterceptors,
      enableLogging: enableLogging,
    );
  }

  @override
  Future<BaseResponse<K>> fetch<T, K>({
    required String path,
    required dynamic Function(Map<String, dynamic> json) fromJson,
    BaseRequest? data,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        path,
        data: data?.toJson(),
      );
      return networkParser.parse<T, K>(response: response, fromJson: fromJson);
    } on DioException catch (error) {
      return BaseResponse.error(error.response?.statusCode == HttpStatus.unauthorized ? ResponseMessageModel(text: error.message ?? '') : null);
    } catch (error) {
      return BaseResponse.error(ResponseMessageModel(text: '$error'));
    }
  }

  @override
  Future<BaseResponse<K>> send<T, K>({
    required String path,
    required dynamic Function(Map<String, dynamic> json) fromJson,
    required BaseRequest? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        path,
        data: data?.toJson(),
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      return networkParser.parse<T, K>(response: response, fromJson: fromJson);
    } on DioException catch (error) {
      return (error.response?.data == null)
          ? BaseResponse.error(error.response?.statusCode == HttpStatus.unauthorized ? ResponseMessageModel(text: error.message ?? '') : null)
          : networkParser.parse<T, K>(response: error.response!, fromJson: fromJson);
    } catch (error) {
      return BaseResponse.error(ResponseMessageModel(text: '$error'));
    }
  }

  @override
  Future<BaseResponse<K>> update<T, K>({
    required String path,
    required dynamic Function(Map<String, dynamic> json) fromJson,
    BaseRequest? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final response = await dio.put<Map<String, dynamic>>(
        path,
        data: data?.toJson(),
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      return networkParser.parse<T, K>(response: response, fromJson: fromJson);
    } on DioException catch (error) {
      return BaseResponse.error(error.response?.statusCode == HttpStatus.unauthorized ? ResponseMessageModel(text: error.message ?? '') : null);
    } catch (error) {
      return BaseResponse.error(ResponseMessageModel(text: '$error'));
    }
  }

  @override
  Future<BaseResponse<K>> delete<T, K>({
    required String path,
    required dynamic Function(Map<String, dynamic> json) fromJson,
    id,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.delete<Map<String, dynamic>>(
        id != null ? '$path/$id' : path,
        options: options,
        cancelToken: cancelToken,
      );
      return networkParser.parse<T, K>(response: response, fromJson: fromJson);
    } on DioException catch (error) {
      return BaseResponse.error(error.response?.statusCode == HttpStatus.unauthorized ? ResponseMessageModel(text: error.message ?? '') : null);
    } catch (error) {
      return BaseResponse.error(ResponseMessageModel(text: '$error'));
    }
  }
}
