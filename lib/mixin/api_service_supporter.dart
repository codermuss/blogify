import 'package:blogify/network/clients/dio/dio_http_client.dart';

import '../app/app.locator.dart';

mixin ApiServiceSupporter {
  DioHttpClient get dioHttpClient => locator<DioHttpClient>();
}
