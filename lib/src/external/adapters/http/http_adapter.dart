import 'dart:convert';

import 'package:http/http.dart';

import 'package:seller/src/domain/helpers/http_helper.dart';

import 'package:seller/src/data/clients/http/http_client.dart';

import 'package:seller/src/external/interceptors/http_interceptor.dart';

class HttpAdapter implements HttpClient {
  late final HttpInterceptor _http;

  final int serverError = 500;
  final Duration timeout = const Duration(seconds: 400);

  HttpAdapter(this._http);

  @override
  Future<Map<String, dynamic>> call({
    required String url,
    required HttpMethod method,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    var _response = Response('', serverError);

    Future<Response>? _futureResponse;

    final _jsonBody = _buildBody(body);
    final _defaultHeaders = _buildHeaders(headers);

    try {
      switch (method) {
        case HttpMethod.post:
          _futureResponse = _http.post(
            Uri.parse(url),
            body: _jsonBody,
            headers: _defaultHeaders,
          );
          break;
        case HttpMethod.get:
          _futureResponse = _http.get(
            Uri.parse(url),
            headers: _defaultHeaders,
          );
          break;
        case HttpMethod.put:
          _futureResponse = _http.put(
            Uri.parse(url),
            body: _jsonBody,
            headers: _defaultHeaders,
          );
          break;
        case HttpMethod.patch:
          _futureResponse = _http.patch(
            Uri.parse(url),
            body: _jsonBody,
            headers: _defaultHeaders,
          );
          break;
        case HttpMethod.delete:
          _futureResponse = _http.delete(
            Uri.parse(url),
            headers: _defaultHeaders,
          );
          break;
      }

      _response = await _futureResponse.timeout(timeout);
    } catch (error) {
      throw HttpResponse.serverError;
    }

    return _buildResponse(_response);
  }

  String? _buildBody(Map<String, dynamic>? body) =>
      body != null ? jsonEncode(body) : null;

  Map<String, String> _buildHeaders(Map<String, String>? headers) =>
      headers?.cast<String, String>() ?? {}
        ..addAll({
          'accept': 'application/json',
          'content-type': 'application/json',
        });

  Map<String, dynamic> _buildResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body.isEmpty
            ? {} as Map<String, dynamic>
            : jsonDecode(response.body);
      case 204:
        return {} as Map<String, dynamic>;
      case 400:
        throw HttpResponse.badRequest;
      case 401:
        throw HttpResponse.unauthorized;
      case 403:
        throw HttpResponse.forbidden;
      case 404:
        throw HttpResponse.notFound;
      default:
        throw HttpResponse.serverError;
    }
  }
}
