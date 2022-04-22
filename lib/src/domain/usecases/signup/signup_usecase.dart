import 'package:seller/src/domain/entities/signup/signup_entity.dart';
import 'package:seller/src/domain/helpers/http_helper.dart';

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
