import 'package:dio/dio.dart';

import 'package:provider/provider.dart';

import 'package:seller/src/modules/http/data/clients/http_client.dart';
import 'package:seller/src/modules/http/external/adapters/http_adapter.dart';

import 'package:seller/src/modules/storage/domain/usecases/storage_usecase.dart';

import 'package:seller/src/modules/firabase/domain/usecases/remote_config_usecase.dart';

final httpModule = [
  Provider<Dio>.value(
    value: Dio(),
  ),
  Provider<HttpClient>(
    create: (context) => HttpAdapter(
      context.read<Dio>(),
      context.read<StorageUseCase>(),
      context.read<RemoteConfigUseCase>(),
    ),
  ),
];
