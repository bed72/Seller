import 'package:mocktail/mocktail.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:seller/src/modules/http/domain/params/http_params.dart';

import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

import 'package:seller/src/modules/auth/domain/entities/signup/signup_entity.dart';
import 'package:seller/src/modules/auth/domain/usecases/signup/signup_usecase.dart';
import 'package:seller/src/modules/auth/data/usecases/signup/remote_signup_usecase.dart';

import '../../../../http/data/mocks/http_client_spy.dart';
import '../../../domain/entities/signup/signup_params_fake.dart';
import '../../../external/mocks/auth/responses/signup/signup_response.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(HttpParamsFake());
  });

  group('Should test SignUp layer', () {
    late HttpParams params;
    late HttpClientSpy httpClient;
    late SignUpUseCase remoteSignUpUseCase;
    late Either<HttpException, Map<String, dynamic>> apiResult;

    setUp(() {
      params = HttpParamsFake();
      apiResult = SignUpResponse.makeJsonSuccess();
      httpClient = HttpClientSpy()..mockRequestPostSuccess(apiResult);
      remoteSignUpUseCase = RemoteSignUpUseCase(httpClient);
    });

    test('Should call HttpClient with correct values', () async {
      final value = await remoteSignUpUseCase(params);

      verify(() => httpClient.post(params: params)).called(1);

      expect(value.right.runtimeType, SignUpEntity);
      expect(value.right.accessToken.isNotEmpty, true);
    });
  });
}
