import 'package:seller/src/modules/http/data/clients/http_client.dart';

import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

import 'package:seller/src/modules/auth/data/models/me/me_model.dart';
import 'package:seller/src/modules/auth/domain/entities/me/me_entity.dart';
import 'package:seller/src/modules/auth/domain/usecases/me/me_usecase.dart';

class RemoteMeUseCase extends MeUseCase {
  late final HttpClient _call;

  RemoteMeUseCase(this._call);

  @override
  Future<Either<HttpException, MeEntity>> call(
    MeParams params,
  ) async {
    final _response = await _call(
      url: params.url,
      method: params.httpMethod,
    );

    return _response.either(
      (left) => left,
      (right) => MeModel.fromJson(right),
    );
  }
}
