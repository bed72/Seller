import 'package:seller/src/modules/http/domain/params/http_params.dart';

import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';
import 'package:seller/src/modules/auth/domain/entities/me/me_entity.dart';

abstract class MeUseCase {
  Future<Either<HttpException, MeEntity>> call(HttpParams params);
}
