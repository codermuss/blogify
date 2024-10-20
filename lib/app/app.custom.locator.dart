import 'package:stacked/stacked_annotations.dart';

import '../network/clients/dio/dio_http_client.dart';

final _locator = StackedLocator.instance;

void setupCustomLocator() {
// Register dependencies
  _locator.registerLazySingleton(() => DioHttpClient(baseUrl: 'localhost:8080/v1'));
}
