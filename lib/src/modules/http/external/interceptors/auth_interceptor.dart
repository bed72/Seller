import 'dart:async';

import 'package:dio/dio.dart';

import 'package:seller/src/utils/constants/app_constant.dart';

import 'package:seller/src/modules/storage/domain/usecases/storage_usecase.dart';

class AuthInterceptor extends Interceptor {
  late final StorageUseCase _storageUseCase;

  AuthInterceptor(this._storageUseCase);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    super.onRequest(options, handler);

    if (AppContants.urlAuthSignUp != options.path) {
      options.headers.addAll(_addAuthorizationHeader());
    }
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    super.onResponse(response, handler);

    if (AppContants.urlAuthSignUp == response.realUri.path) {
      await _verifyResponse(
        response.data['expires_in'],
        response.data['access_token'],
        response.data['refresh_token'],
      );
    }
  }

  Map<String, String> _addAuthorizationHeader() {
    final _accessToken = _getAccessToken();

    return <String, String>{'authorization': 'Bearer $_accessToken'};
  }

  Future<void> _verifyResponse(
    int expiresIn,
    String accessToken,
    String refreshToken,
  ) async {
    if (accessToken.isNotEmpty && refreshToken.isNotEmpty) {
      await Future.wait([
        _saveAuthData(AppContants.keyAccessToken, accessToken),
        _saveAuthData(AppContants.keyRefreshToken, refreshToken),
        _saveAuthData(AppContants.keyExpiresIn, expiresIn.toString()),
      ]);
    }
  }

  String _getAccessToken() {
    final _data = _storageUseCase.get(key: AppContants.keyAccessToken);

    return _data.isRight ? _data.right : '';
  }

  Future<void> _saveAuthData(String key, String data) async {
    await _storageUseCase.save(
      key: key,
      value: data,
    );
  }
}
