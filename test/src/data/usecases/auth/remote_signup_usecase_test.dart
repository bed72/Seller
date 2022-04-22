import 'package:mocktail/mocktail.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:seller/src/domain/helpers/http_helper.dart';

import 'package:seller/src/domain/usecases/signup/signup_usecase.dart';

import 'package:seller/src/data/usecases/signup/remote_signup_usecase.dart';

import '../../mocks/http_client_spy.dart';
import '../../../domain/entities/auth/signup_params_fake.dart';
import '../../../external/mocks/responses/auth/signup/signup_response.dart';

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
