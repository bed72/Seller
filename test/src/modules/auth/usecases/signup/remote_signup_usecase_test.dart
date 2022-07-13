import 'package:mocktail/mocktail.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:seller/src/modules/http/domain/params/http_params.dart';

import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

import 'package:seller/src/modules/auth/domain/entities/signup/signup_entity.dart';
import 'package:seller/src/modules/auth/domain/usecases/signup/signup_usecase.dart';
import 'package:seller/src/modules/auth/data/usecases/signup/remote_signup_usecase.dart';

import 'spy/sign_up_spy.dart';
import '../../mocks/http_params_fake.dart';
import '../../mocks/responses/signup_mock_response.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(HttpParamsFake());
  });

  group('Should testing SignUp layer with JSON response mode', () {
    late HttpParams params;
    late SignUpUseCase useCase;
    late Either<HttpException, Map<String, dynamic>> result;

    setUp(() {
      params = HttpParamsFake();
      result = SignUpMockResponse.buildJsonSuccess();
      useCase = RemoteSignUpUseCase(SignUpSpy()..mockSuccess(result));
    });

    test('Should call SignUpUseCase with correct values', () async {
      final value = await useCase(params);

      verify(() => useCase(params)).called(1);

      expect(value.right.runtimeType, SignUpEntity);
      expect(value.right.accessToken.isNotEmpty, true);
    });
  });
}
