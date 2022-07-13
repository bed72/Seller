import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

import 'package:seller/src/modules/http/data/clients/http_client.dart';
import 'package:seller/src/modules/http/domain/params/http_params.dart';
import 'package:seller/src/modules/http/domain/usecases/http_post_usecase.dart';

class RemoteHttpPostUseCase implements HttpPostUseCase {
  late final HttpClient _httpClient;

  RemoteHttpPostUseCase(this._httpClient);

  @override
  Future<Either<HttpException, Map<String, dynamic>>> call(
    HttpParams params,
  ) async =>
      await _httpClient.post(params: params);
}
