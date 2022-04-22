import 'dart:async';

import 'package:dio/dio.dart';

import 'package:seller/src/domain/usecases/storage/storage_usecase.dart';

import 'package:seller/src/presentation/utils/constants/app_constant.dart';

class AuthInterceptor extends Interceptor {
  late final StorageUsecase _storageUseCase;

  AuthInterceptor(this._storageUseCase);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    super.onRequest(options, handler);

    if (AppContants.urlAuthSignUp != options.path) {
      options.headers.addAll(await _addAuthorizationHeader());
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

  Future<Map<String, String>> _addAuthorizationHeader() async {
    final _accessToken = await _getAccessToken();

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

  Future<String?> _getAccessToken() async =>
      await _storageUseCase.fetch(key: AppContants.keyAccessToken);

  Future<void> _saveAuthData(String key, String data) async {
    await _storageUseCase.save(
      key: key,
      value: data,
    );
  }
}
