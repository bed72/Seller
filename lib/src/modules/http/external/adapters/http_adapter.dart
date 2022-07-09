import 'package:dio/dio.dart';

import 'package:seller/src/core/domain/entities/either/left_entity.dart';
import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/right_entity.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

import 'package:seller/src/modules/http/data/clients/http_client.dart';
import 'package:seller/src/modules/http/domain/params/http_params.dart';
import 'package:seller/src/modules/http/data/clients/config_dio_client.dart';

class HttpAdapter implements HttpClient {
  late final Dio _http;
  late final ConfigDioClient _dioAdapter;

  HttpAdapter(
    this._http,
    this._dioAdapter,
  ) {
    configureHttp();
  }

  @override
  void configureHttp() {
    _http.options = _dioAdapter.buildDioSettings();
    _http.interceptors.addAll(_dioAdapter.builInterceptors());
  }

  @override
  Future<Either<HttpException, Map<String, dynamic>>> get({
    required HttpParams params,
  }) async {
    try {
      final response = await _http.get(
        params.url,
        options: _dioAdapter.buildOptions(params),
      );

      return Right(_dioAdapter.buildResponseSuccess(response));
    } on DioError catch (error) {
      return Left(_dioAdapter.buildResponseError(error));
    }
  }

  @override
  Future<Either<HttpException, Map<String, dynamic>>> post({
    required HttpParams params,
  }) async {
    try {
      final response = await _http.post(
        params.url,
        data: _dioAdapter.buildBody(params.body),
        options: _dioAdapter.buildOptions(params),
      );

      return Right(_dioAdapter.buildResponseSuccess(response));
    } on DioError catch (error) {
      return Left(_dioAdapter.buildResponseError(error));
    }
  }
}
