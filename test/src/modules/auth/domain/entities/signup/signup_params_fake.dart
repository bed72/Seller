import 'package:seller/src/modules/http/domain/helpers/http_helper.dart';

import 'package:seller/src/modules/auth/domain/usecases/signup/signup_usecase.dart';

class SignUpParamsFake extends SignUpParams {
  SignUpParamsFake({
    String url = 'https://address_web.com.br/v1/auth/sign_up',
    String email = 'email@email.com',
    String password = 'use_secure_password',
    HttpMethod httpMethod = HttpMethod.post,
  }) : super(
          url: url,
          email: email,
          password: password,
          httpMethod: httpMethod,
        );
}
