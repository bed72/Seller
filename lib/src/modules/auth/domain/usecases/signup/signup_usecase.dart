import 'package:seller/src/modules/http/domain/helpers/http_helper.dart';

import 'package:seller/src/modules/auth/domain/entities/signup/signup_entity.dart';

abstract class SignUpUseCase {
  Future<SignUpEntity> call(SignUpParams params);
}

class SignUpParams {
  final String url;
  final String email;
  final String password;
  final HttpMethod httpMethod;

  const SignUpParams({
    required this.url,
    required this.email,
    required this.password,
    required this.httpMethod,
  });

  Map<String, dynamic> get toJson => {
        'email': email,
        'password': password,
      };
}
