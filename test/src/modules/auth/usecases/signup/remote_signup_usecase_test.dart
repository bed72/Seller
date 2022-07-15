import 'package:mocktail/mocktail.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:seller/src/modules/http/domain/helpers/http_helper.dart';

import 'package:seller/src/modules/http/domain/params/http_params.dart';

import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

import 'package:seller/src/modules/auth/domain/entities/signup/signup_entity.dart';
import 'package:seller/src/modules/auth/domain/usecases/signup/signup_usecase.dart';
import 'package:seller/src/modules/auth/data/usecases/signup/remote_signup_usecase.dart';

import 'spy/sign_up_usecase_spy.dart';
import '../../mocks/http_params_fake.dart';
import '../../mocks/responses/signup_mock_response.dart';

void main() {
  late final HttpParams params;
  late final SignUpUseCase useCase;
  late final Either<HttpException, Map<String, dynamic>> result;

  setUpAll(() {
    params = HttpParamsFake();

    registerFallbackValue(HttpParamsFake());
  });

  group('Should testing SignUp layer with JSON response success Right', () {
    setUp(() {
      result = SignUpMockResponse.buildJsonSuccess();
      useCase = RemoteSignUpUseCase(SignUpUseCaseSpy()..mockSuccess(result));
    });

    test('Should call SignUpUseCase with correct values', () async {
      final value = await useCase(params);

      expect(value.right, isA<SignUpEntity>());
      expect(value.right.accessToken.isNotEmpty, true);
    });
  });

  group('Should testing SignUp layer with JSON response failure Left', () {
    setUp(() {
      result = SignUpMockResponse.buildJsonFailure();
      useCase = RemoteSignUpUseCase(SignUpUseCaseSpy()..mockFailure(result));
    });

    test('Should call SignUpUseCase with correct values', () async {
      final value = await useCase(params);

      expect(value.left, isA<HttpException>());
      expect(value.left.code, HttpResponse.serverError);
      expect(value.left.message, HttpResponse.serverError.value);
    });
  });
}
