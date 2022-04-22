import 'package:seller/src/data/clients/http/http_client.dart';
import 'package:seller/src/data/models/signup/signup_model.dart';

import 'package:seller/src/domain/helpers/http_helper.dart';
import 'package:seller/src/domain/entities/signup/signup_entity.dart';
import 'package:seller/src/domain/usecases/signup/signup_usecase.dart';

class RemoteSignUpUseCase extends SignUpUseCase {
  late final HttpClient _call;

  RemoteSignUpUseCase(this._call);

  @override
  Future<SignUpEntity> call(SignUpParams params) async {
    try {
      final _response = await _call(
        url: params.url,
        body: params.toJson,
        method: params.httpMethod,
      );

      return SignUpModel.fromJson(_response);
    } on HttpResponse catch (_) {
      rethrow;
    }
  }
}
