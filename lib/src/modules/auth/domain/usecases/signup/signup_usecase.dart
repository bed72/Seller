import 'package:seller/src/modules/http/domain/params/http_params.dart';

import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

import 'package:seller/src/modules/auth/domain/entities/signup/signup_entity.dart';

abstract class SignUpUseCase {
  Future<Either<HttpException, SignUpEntity>> call(HttpParams params);
}
