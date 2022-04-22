import 'package:dio/dio.dart';

import 'package:provider/provider.dart';

import 'package:seller/src/utils/constants/app_constant.dart';

import 'package:seller/src/modules/http/data/clients/http_client.dart';
import 'package:seller/src/modules/http/external/adapters/http_adapter.dart';

import 'package:seller/src/modules/storage/domain/usecases/storage_usecase.dart';

final httpModule = [
  Provider<Dio>.value(
    value: Dio(
      BaseOptions(
        maxRedirects: 2,
        sendTimeout: 6000,
        receiveTimeout: 6000,
        connectTimeout: 6000,
        responseType: ResponseType.json,
        baseUrl: AppContants.urlHowgarts,
      ),
    ),
  ),
  Provider<HttpClient>(
    create: (context) => HttpAdapter(
      context.read<Dio>(),
      context.read<StorageUsecase>(),
    ),
  ),
];
