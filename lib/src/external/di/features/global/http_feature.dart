import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

import 'package:seller/src/data/clients/http/http_client.dart';

import 'package:seller/src/external/adapters/http/http_adapter.dart';

import 'package:seller/src/domain/usecases/storage/storage_usecase.dart';

import 'package:seller/src/presentation/utils/constants/app_constant.dart';

void httpFeature(GetIt locator) {
  locator.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        maxRedirects: 2,
        sendTimeout: 6000,
        receiveTimeout: 6000,
        connectTimeout: 6000,
        responseType: ResponseType.json,
        baseUrl: AppContants.urlHowgarts,
      ),
    ),
  );

  locator.registerLazySingleton<HttpClient>(
    () => HttpAdapter(
      locator<Dio>(),
      locator.get<StorageUsecase>(),
    ),
  );
}
