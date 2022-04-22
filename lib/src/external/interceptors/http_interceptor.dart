import 'dart:convert';

import 'package:http/http.dart';

import 'package:seller/src/domain/usecases/storage/storage_usecase.dart';
import 'package:seller/src/presentation/utils/constants/app_constant.dart';

class HttpInterceptor extends BaseClient {
  late final StorageUsecase _storageUseCase;

  HttpInterceptor(this._storageUseCase);

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    request.headers.addAll(_buildHeaders({}));

    if (!AppContants.urlAuthSignUp.contains(request.url.path)) {
      request.headers.addAll(await _guardAuthorizationHeader());
    }

    return request.send();
  }

  Future<Map<String, String>> _guardAuthorizationHeader() async {
    final _token = await _getToken();

    return _buildHeaders({'authorization': 'Bearer $_token'});
  }

  Map<String, String> _buildHeaders(Map<String, String>? headers) =>
      headers?.cast<String, String>() ?? {}
        ..addAll({
          'accept': 'application/json',
          'content-type': 'application/json',
          'apikey': AppContants.apikeyAnon,
        });

  Future<String?> _getToken() async {
    final _valueAuth = await _storageUseCase.fetch(key: AppContants.keyAuth);
    final Map<String, dynamic> _dataAuth = jsonDecode(_valueAuth);

    return _dataAuth['access_token'];
  }
}
