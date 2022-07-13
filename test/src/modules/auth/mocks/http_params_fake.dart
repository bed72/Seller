import 'package:seller/src/modules/http/domain/params/http_params.dart';

class HttpParamsFake extends HttpParams {
  HttpParamsFake({
    String email = 'email@email.com',
    String password = 'use_secure_password',
    String url = 'https://address_web.com.br/v1/auth/sign_up',
  }) : super(
          body: {
            'email': email,
            'password': password,
          },
          header: {
            'accept': 'application/json',
            'content-type': 'application/json',
          },
          url: url,
        );
}
