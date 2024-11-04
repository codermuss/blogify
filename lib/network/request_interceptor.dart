import 'package:blogify/extensions/context_extensions.dart';
import 'package:dio/dio.dart';
import 'package:stacked_services/stacked_services.dart';

class RequestInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.path = '${options.path}?locale=${StackedService.navigatorKey?.currentContext?.getCurrentLocale}';
    return handler.next(options);
  }
}
