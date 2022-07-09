import 'package:seller/src/modules/http/data/clients/http_client.dart';

import 'package:seller/src/modules/http/domain/params/http_params.dart';

import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

import 'package:seller/src/modules/auth/data/models/signup/signup_model.dart';

import 'package:seller/src/modules/auth/domain/entities/signup/signup_entity.dart';
import 'package:seller/src/modules/auth/domain/usecases/signup/signup_usecase.dart';

class RemoteSignUpUseCase extends SignUpUseCase {
  late final HttpClient _httpClient;

  RemoteSignUpUseCase(this._httpClient);

  @override
  Future<Either<HttpException, SignUpEntity>> call(
    HttpParams params,
  ) async {
    final response = await _httpClient.post(
      params: params,
    );

    return response.either(
      (left) => left,
      (right) => SignUpModel.fromJson(right),
    );
  }
}
