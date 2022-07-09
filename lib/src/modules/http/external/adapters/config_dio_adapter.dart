import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:seller/src/utils/constants/app_constant.dart';

import 'package:seller/src/core/domain/entities/exception/exception.dart';

import 'package:seller/src/modules/storage/domain/usecases/storage_usecase.dart';

import 'package:seller/src/modules/http/domain/params/http_params.dart';
import 'package:seller/src/modules/http/data/clients/config_dio_client.dart';
import 'package:seller/src/modules/http/data/mappers/http_response_mapper.dart';
import 'package:seller/src/modules/http/external/interceptors/auth_interceptor.dart';

import 'package:seller/src/modules/firabase/domain/usecases/remote_config_usecase.dart';

class ConfigDioAdapter implements ConfigDioClient {
  late final _timeout = 6000;

  late final StorageUseCase _storageUseCase;
  late final RemoteConfigUseCase _remoteConfigUseCase;
  late final HttpResponseMapper _httpReponseMapperUseCase;

  ConfigDioAdapter(
    this._storageUseCase,
    this._remoteConfigUseCase,
    this._httpReponseMapperUseCase,
  );

  @override
  String? buildBody(Map<String, dynamic>? body) =>
      body != null ? jsonEncode(body) : null;

  @override
  List<Interceptor> builInterceptors() => [
        AuthInterceptor(_storageUseCase),
      ];

  @override
  Options buildOptions(HttpParams params) => Options(
        headers: _buildHeaders(params.header),
      );

  @override
  BaseOptions buildDioSettings() => BaseOptions(
        maxRedirects: 2,
        sendTimeout: _timeout,
        receiveTimeout: _timeout,
        connectTimeout: _timeout,
        responseType: ResponseType.json,
        baseUrl: _buildDataRemoteConfig(AppContants.urlHowgarts),
      );

  @override
  Map<String, dynamic> buildResponseSuccess(
    Response<dynamic> response,
  ) =>
      _httpReponseMapperUseCase.success(response);

  @override
  HttpException buildResponseError(DioError error) =>
      _httpReponseMapperUseCase.error(error);

  Map<String, String> _buildHeaders(Map<String, dynamic>? headers) =>
      headers?.cast<String, String>() ?? {}
        ..addAll({
          'accept': 'application/json',
          'content-type': 'application/json',
          'apikey': _buildDataRemoteConfig(AppContants.apikeyAnon),
        });

  String _buildDataRemoteConfig(String key) {
    final value = _remoteConfigUseCase.getString(
      key: key,
      defaultValue: '',
    );

    return value.isRight ? value.right : '';
  }
}
