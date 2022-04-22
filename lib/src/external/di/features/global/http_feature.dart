import 'package:get_it/get_it.dart';

import 'package:seller/src/data/clients/http/http_client.dart';

import 'package:seller/src/external/adapters/http/http_adapter.dart';
import 'package:seller/src/external/interceptors/http_interceptor.dart';

import 'package:seller/src/domain/usecases/storage/storage_usecase.dart';

void httpFeature(GetIt locator) {
  locator.registerLazySingleton<HttpInterceptor>(
    () => HttpInterceptor(locator.get<StorageUsecase>()),
  );

  locator.registerLazySingleton<HttpClient>(
    () => HttpAdapter(locator<HttpInterceptor>()),
  );
}
