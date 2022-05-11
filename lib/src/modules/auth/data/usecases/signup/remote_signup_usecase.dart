import 'package:seller/src/modules/http/data/clients/http_client.dart';

import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

import 'package:seller/src/modules/auth/data/models/signup/signup_model.dart';

import 'package:seller/src/modules/auth/domain/entities/signup/signup_entity.dart';
import 'package:seller/src/modules/auth/domain/usecases/signup/signup_usecase.dart';

class RemoteSignUpUseCase extends SignUpUseCase {
  late final HttpClient _call;

  RemoteSignUpUseCase(this._call);

  @override
  Future<Either<HttpException, SignUpEntity>> call(
    SignUpParams params,
  ) async {
    final response = await _call(
      url: params.url,
      body: params.toJson,
      method: params.httpMethod,
    );

    return response.either(
      (left) => left,
      (right) => SignUpModel.fromJson(right),
    );
  }
}
