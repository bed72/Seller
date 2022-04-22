import 'package:mocktail/mocktail.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:seller/src/modules/http/domain/helpers/http_helper.dart';
import 'package:seller/src/modules/auth/domain/usecases/signup/signup_usecase.dart';

import 'package:seller/src/modules/auth/data/usecases/signup/remote_signup_usecase.dart';

import '../../../../http/data/mocks/http_client_spy.dart';
import '../../../domain/entities/signup/signup_params_fake.dart';
import '../../../external/mocks/auth/responses/signup/signup_response.dart';

void main() {
  group('Should test SignUp layer', () {
    late SignUpParams params;
    late HttpClientSpy httpClient;
    late Map<String, dynamic> apiResult;
    late SignUpUseCase remoteSignUpUseCase;

    setUp(() {
      params = SignUpParamsFake();
      apiResult = SignUpResponse.makeJson();
      httpClient = HttpClientSpy()..mockRequest(apiResult);
      remoteSignUpUseCase = RemoteSignUpUseCase(httpClient);
    });

    // ignore: unused_element
    void _setHttpMethod({HttpMethod method = HttpMethod.post}) {
      httpClient = HttpClientSpy(method: method)..mockRequest(apiResult);
      remoteSignUpUseCase = RemoteSignUpUseCase(httpClient);
    }

    test('Should call HttpClient with correct values', () async {
      await remoteSignUpUseCase(params);

      verify(
        () => httpClient(
          url: params.url,
          method: params.httpMethod,
          body: {'email': params.email, 'password': params.password},
        ),
      );
    });
  });
}
