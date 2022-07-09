import 'package:dio/dio.dart';
import 'package:seller/src/core/domain/entities/exception/exception.dart';

import 'package:seller/src/modules/http/domain/params/http_params.dart';

abstract class ConfigDioClient {
  BaseOptions buildDioSettings();
  List<Interceptor> builInterceptors();
  Options buildOptions(HttpParams params);
  String? buildBody(Map<String, dynamic>? body);
  HttpException buildResponseError(DioError error);
  Map<String, dynamic> buildResponseSuccess(Response<dynamic> response);
}
