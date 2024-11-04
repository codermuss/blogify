import '../../models/base/base_reques.dart';
import '../../models/base/base_response.dart';

abstract class INetworkService {
  Future<BaseResponse<K>> fetch<T, K>({required String path, required K Function(Map<String, dynamic> json) fromJson, BaseRequest? data});
  Future<BaseResponse<K>> send<T, K>({required String path, required K Function(Map<String, dynamic> json) fromJson, required BaseRequest data});
  Future<BaseResponse<K>> update<T, K>({required String path, required K Function(Map<String, dynamic> json) fromJson, required BaseRequest data});
  Future<BaseResponse<K>> delete<T, K>({required String path, required K Function(Map<String, dynamic> json) fromJson, dynamic id});
}
