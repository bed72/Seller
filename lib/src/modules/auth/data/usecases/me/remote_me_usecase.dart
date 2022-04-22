import 'package:seller/src/modules/auth/data/models/me/me_model.dart';

import 'package:seller/src/modules/http/data/clients/http_client.dart';
import 'package:seller/src/modules/http/domain/helpers/http_helper.dart';

import 'package:seller/src/modules/auth/domain/entities/me/me_entity.dart';
import 'package:seller/src/modules/auth/domain/usecases/me/me_usecase.dart';

class RemoteMeUseCase extends MeUseCase {
  late final HttpClient _call;

  RemoteMeUseCase(this._call);

  @override
  Future<MeEntity> getMe(MeParams params) async {
    try {
      final _response = await _call(
        url: params.url,
        method: HttpMethod.get,
      );

      return MeModel.fromJson(_response);
    } on HttpResponse catch (_) {
      rethrow;
    }
  }
}
