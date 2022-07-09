import 'package:dio/dio.dart';

import 'package:seller/src/modules/http/domain/helpers/http_helper.dart';

import 'package:seller/src/core/domain/entities/exception/exception.dart';

import 'package:seller/src/modules/http/data/mappers/http_response_mapper.dart';

class HttpReponseMapper implements HttpResponseMapper {
  @override
  Map<String, dynamic> success(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        return response.data.isEmpty ? _buildEmptyBody() : response.data;
      case 204:
        return _buildEmptyBody();
      default:
        return _buildEmptyBody();
    }
  }

  @override
  HttpException error(DioError error) {
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

  Map<String, String> _buildEmptyBody() => {
        'response': 'ok',
      };
}
