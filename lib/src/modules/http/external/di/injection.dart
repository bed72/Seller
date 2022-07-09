import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

import 'package:seller/src/core/external/di/module.dart';

import 'package:seller/src/modules/http/data/clients/http_client.dart';
import 'package:seller/src/modules/http/data/clients/config_dio_client.dart';
import 'package:seller/src/modules/http/data/mappers/http_response_mapper.dart';

import 'package:seller/src/modules/storage/domain/usecases/storage_usecase.dart';

import 'package:seller/src/modules/http/external/adapters/http_adapter.dart';
import 'package:seller/src/modules/http/external/mappers/response_mapper.dart';
import 'package:seller/src/modules/http/external/adapters/config_dio_adapter.dart';

import 'package:seller/src/modules/firabase/domain/usecases/remote_config_usecase.dart';

class HttpModule implements Module {
  final GetIt locator;

  HttpModule(this.locator);

  @override
  Future<void> initialized() async {
    // Mappers
    locator.registerFactory<HttpResponseMapper>(
      () => HttpReponseMapper(),
    );

    locator
      ..registerSingleton<Dio>(Dio())
      ..registerLazySingleton<ConfigDioClient>(
        () => ConfigDioAdapter(
          locator.get<StorageUseCase>(),
          locator.get<RemoteConfigUseCase>(),
          locator.get<HttpResponseMapper>(),
        ),
      )
      ..registerLazySingleton<HttpClient>(
        () => HttpAdapter(
          locator.get<Dio>(),
          locator.get<ConfigDioClient>(),
        ),
      );
  }
}
