import 'package:dio/dio.dart';

import 'package:seller/src/core/domain/entities/exception/exception.dart';

abstract class HttpResponseMapper {
  HttpException error(DioError error);
  Map<String, dynamic> success(Response<dynamic> response);
}
