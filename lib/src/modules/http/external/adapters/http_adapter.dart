import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:seller/src/utils/constants/app_constant.dart';

import 'package:seller/src/core/domain/entities/either/left_entity.dart';
import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/right_entity.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

import 'package:seller/src/modules/storage/domain/usecases/storage_usecase.dart';

import 'package:seller/src/modules/http/data/clients/http_client.dart';
import 'package:seller/src/modules/http/domain/helpers/http_helper.dart';
import 'package:seller/src/modules/http/external/interceptors/auth_interceptor.dart';

import 'package:seller/src/modules/firabase/domain/usecases/remote_config_usecase.dart';

class HttpAdapter implements HttpClient {
  late final Dio _http;
  late final StorageUseCase _storageUseCase;
  late final RemoteConfigUseCase _remoteConfigUseCase;

  HttpAdapter(
    this._http,
    this._storageUseCase,
    this._remoteConfigUseCase,
  ) {
    configureHttp();
  }

  @override
  void configureHttp() {
    _configureDio();
    _addInterceptors();
  }

  void _configureDio() {
    _http.options = BaseOptions(
      maxRedirects: 2,
      sendTimeout: 6000,
      receiveTimeout: 6000,
      connectTimeout: 6000,
      responseType: ResponseType.json,
      baseUrl: _getRemoteData(AppContants.urlHowgarts),
    );
  }

  void _addInterceptors() {
    _http.interceptors.add(AuthInterceptor(_storageUseCase));
  }

  @override
  Future<Either<HttpException, Map<String, dynamic>>> call({
    required String url,
    required HttpMethod method,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    Future<Response>? futureResponse;
    Response<dynamic> response = Response(
      requestOptions: RequestOptions(
        path: url,
        sendTimeout: 6,
        headers: _buildHeaders(headers),
        responseType: ResponseType.json,
      ),
    );

    final jsonBody = _buildBody(body);
    final defaultHeaders = _buildHeaders(headers);

    try {
      switch (method) {
        case HttpMethod.post:
          futureResponse = _http.post(
            url,
            data: jsonBody,
            options: Options(headers: defaultHeaders),
          );
          break;
        case HttpMethod.get:
          futureResponse = _http.get(
            url,
            options: Options(headers: defaultHeaders),
          );
          break;
        case HttpMethod.put:
          futureResponse = _http.put(
            url,
            data: jsonBody,
            options: Options(headers: defaultHeaders),
          );
          break;
        case HttpMethod.patch:
          futureResponse = _http.patch(
            url,
            data: jsonBody,
            options: Options(headers: defaultHeaders),
          );
          break;
        case HttpMethod.delete:
          futureResponse = _http.delete(
            url,
            options: Options(headers: defaultHeaders),
          );
          break;
      }

      response = await futureResponse;
    } on DioError catch (error) {
      return Left(_buildResponseError(error));
    }

    return Right(_buildResponseSuccess(response));
  }

  Map<String, String> _buildEmptyBody() => {
        'response': 'ok',
      };

  String? _buildBody(Map<String, dynamic>? body) =>
      body != null ? jsonEncode(body) : null;

  Map<String, String> _buildHeaders(Map<String, String>? headers) =>
      headers?.cast<String, String>() ?? {}
        ..addAll({
          'accept': 'application/json',
          'content-type': 'application/json',
          'apikey': _getRemoteData(AppContants.apikeyAnon),
        });

  String _getRemoteData(String key) {
    final value = _remoteConfigUseCase.getString(
      key: key,
      defaultValue: '',
    );

    return value.isRight ? value.right : '';
  }

  Map<String, dynamic> _buildResponseSuccess(
    Response<dynamic> response,
  ) {
    switch (response.statusCode) {
      case 200:
        return response.data.isEmpty ? _buildEmptyBody() : response.data;
      case 204:
        return _buildEmptyBody();
      default:
        return _buildEmptyBody();
    }
  }

  HttpException _buildResponseError(DioError error) {
    switch (error.response?.statusCode ?? 500) {
      case 400:
        return HttpException(
          code: HttpResponse.badRequest,
          message: HttpResponse.badRequest.value,
        );
      case 401:
        return HttpException(
          code: HttpResponse.unauthorized,
          message: HttpResponse.unauthorized.value,
        );
      case 403:
        return HttpException(
          code: HttpResponse.forbidden,
          message: HttpResponse.forbidden.value,
        );
      case 404:
        return HttpException(
          code: HttpResponse.notFound,
          message: HttpResponse.notFound.value,
        );
      default:
        return HttpException(
          code: HttpResponse.serverError,
          message: HttpResponse.serverError.value,
        );
    }
  }
}
