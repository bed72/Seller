import 'package:seller/src/modules/http/domain/helpers/http_helper.dart';

import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

abstract class HttpClient {
  Future<Either<HandleException, Map<String, dynamic>>> call({
    required String url,
    required HttpMethod method,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });

  void registerInterceptors();
}
