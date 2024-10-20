import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../models/base/base_response.dart';
import '../api_reference_enum.dart';

final class DioNetworkParser {
  DioNetworkParser._privateConstructor();
  static final DioNetworkParser instance = DioNetworkParser._privateConstructor();

  BaseResponse<K> parse<T, K>({required Response<dynamic> response, required dynamic Function(Map<String, dynamic> json) fromJson}) {
    try {
      //* NOTE(mustafayilmazdev): MARK: code: 200 data: Not Null message: Optional
      if (response.statusCode == HttpStatus.ok) {
        //* NOTE(mustafayilmazdev): MARK: code: 200 data: Not Null
        if (response.data[ApiReferenceEnum.data.reference] != null) {
          //* NOTE(mustafayilmazdev): MARK: code: 200 data: List
          if (response.data[ApiReferenceEnum.data.reference] is List) {
            //* NOTE(mustafayilmazdev): MARK: code: 200 data: List message: Optional
            return BaseResponse.success(
                List<T>.from((response.data[ApiReferenceEnum.data.reference] as List).map((json) => fromJson(json as Map<String, dynamic>)).toList()) as K,
                response.data[ApiReferenceEnum.message.reference] != null
                    ? ResponseMessageModel(
                        text: response.data[ApiReferenceEnum.message.reference][ApiReferenceEnum.content.reference] as String,
                        type: (response.data[ApiReferenceEnum.message.reference][ApiReferenceEnum.type.reference] as String),
                      )
                    : null);
          }
          //* NOTE(mustafayilmazdev): MARK: code: 200 data: Single
          else {
            //* NOTE(mustafayilmazdev): MARK: code: 200 data: Single message: Optional
            return BaseResponse.success(
                fromJson(response.data[ApiReferenceEnum.data.reference] as Map<String, dynamic>) as K,
                response.data[ApiReferenceEnum.message.reference] != null
                    ? ResponseMessageModel(
                        text: response.data[ApiReferenceEnum.message.reference][ApiReferenceEnum.content.reference] as String,
                        type: (response.data[ApiReferenceEnum.message.reference][ApiReferenceEnum.type.reference] as String),
                      )
                    : null);
          }
        }
        //* NOTE(mustafayilmazdev): MARK: code: 200 data: null message: null
        else {
          throw 'emptyDataError';
        }
      }
      //* NOTE(mustafayilmazdev): MARK: code: 206 data: null message: Not Null
      else if (response.statusCode == HttpStatus.partialContent || response.statusCode == HttpStatus.badRequest) {
        return BaseResponse.noContent(
          ResponseMessageModel(
            text: response.data[ApiReferenceEnum.message.reference][ApiReferenceEnum.content.reference] as String,
            type: (response.data[ApiReferenceEnum.message.reference][ApiReferenceEnum.type.reference] as String),
          ),
        );
      }
      //* NOTE(mustafayilmazdev): MARK: code: 400 data: null message: Not Null
      else {
        return BaseResponse.error(
          response.data[ApiReferenceEnum.message.reference] != null
              ? ResponseMessageModel(
                  text: response.data[ApiReferenceEnum.message.reference][ApiReferenceEnum.content.reference] as String,
                  type: (response.data[ApiReferenceEnum.message.reference][ApiReferenceEnum.type.reference] as String))
              : null,
        );
      }
    } catch (e) {
      log('*x' * 35);
      log('FROMJSON RUNTIME TYPE::\n${fromJson.runtimeType}');
      log('ERROR::\n$e');
      log('STACKTRACE::\n${StackTrace.current}\n');
      log('*x' * 35);
      return BaseResponse.error(null);
    }
  }
}
