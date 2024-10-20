import 'package:blogify/network/parser/dio_network_parser.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

mixin DioHttpClientMixin {
  late final Dio dio;
  late final DioNetworkParser networkParser;

  /// Initialize Dio and set up interceptors
  void setupDio({
    required String baseUrl,
    Dio? customDio,
    List<Interceptor>? customInterceptors,
    BaseOptions? baseOptions,
    bool enableLogging = true,
  }) {
    dio = customDio ?? Dio(baseOptions ?? defaultBaseOptions(baseUrl: baseUrl));
    networkParser = DioNetworkParser.instance;
    initInterceptors(enableLogging: enableLogging, customInterceptors: customInterceptors);
  }

  void initInterceptors({
    required bool enableLogging,
    List<Interceptor>? customInterceptors,
  }) {
    if (enableLogging) {
      addInterceptors([_createLoggerInterceptor()]);
    }
    if (customInterceptors?.isNotEmpty ?? false) addInterceptors(customInterceptors!);
  }

  /// Add interceptors to Dio instance
  void addInterceptors(List<Interceptor> interceptors) => dio.interceptors.addAll(interceptors);

  /// Standard BaseOptions with default settings
  BaseOptions defaultBaseOptions({
    required String baseUrl,
    Duration connectTimeout = const Duration(seconds: 5), // Default to 5 seconds
    Duration receiveTimeout = const Duration(seconds: 3), // Default to 3 seconds
    Map<String, dynamic>? defaultHeaders,
  }) {
    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      validateStatus: (_) => true,
      headers: defaultHeaders ??
          {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
    );
  }

  /// Merges default and custom headers into request options
  Options mergeHeaders(Map<String, String>? customHeaders) {
    final headers = <String, dynamic>{};
    headers.addAll(dio.options.headers);
    if (customHeaders != null) {
      headers.addAll(customHeaders);
    }
    return Options(headers: headers);
  }

  /// Creates a Pretty Dio Logger for logging requests and responses
  PrettyDioLogger _createLoggerInterceptor() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    );
  }
}
