import 'package:seller/src/data/models/user/user_model.dart';
import 'package:seller/src/data/clients/http/http_client.dart';

import 'package:seller/src/domain/helpers/http_helper.dart';
import 'package:seller/src/domain/entities/user/user_entity.dart';
import 'package:seller/src/domain/usecases/user/user_usecase.dart';

class RemoteUserUseCase extends UserUseCase {
  late final HttpClient _call;

  RemoteUserUseCase(this._call);

  @override
  Future<UserEntity> getUser(UserParams params) async {
    try {
      final _response = await _call(
        url: params.url,
        method: HttpMethod.get,
      );

      return UserModel.fromJson(_response);
    } on HttpResponse catch (_) {
      rethrow;
    }
  }
}
