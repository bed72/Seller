import 'package:seller/src/modules/auth/data/models/me/me_model.dart';
import 'package:seller/src/modules/http/data/clients/http_client.dart';

import 'package:seller/src/modules/http/domain/params/http_params.dart';

import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

import 'package:seller/src/modules/auth/domain/entities/me/me_entity.dart';
import 'package:seller/src/modules/auth/domain/usecases/me/me_usecase.dart';

class RemoteMeUseCase implements MeUseCase {
  late final HttpClient _httpClient;

  RemoteMeUseCase(this._httpClient);

  @override
  Future<Either<HttpException, MeEntity>> call(
    HttpParams params,
  ) async {
    final response = await _httpClient.get(params: params);

    return response.either(
      (left) => left,
      (right) => MeModel.fromJson(right),
    );
  }
}
