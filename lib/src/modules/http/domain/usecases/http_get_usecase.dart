import 'package:seller/src/modules/http/domain/params/http_params.dart';

import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

abstract class HttpGetUseCase {
  Future<Either<HttpException, Map<String, dynamic>>> call(
    HttpParams params,
  );
}
