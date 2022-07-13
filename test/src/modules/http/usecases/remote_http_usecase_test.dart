import 'package:mocktail/mocktail.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:seller/src/modules/http/domain/params/http_params.dart';

import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

import 'package:seller/src/modules/http/domain/usecases/http_get_usecase.dart';
import 'package:seller/src/modules/http/domain/usecases/http_post_usecase.dart';
import 'package:seller/src/modules/http/data/usecases/remote_http_get_usecase.dart';
import 'package:seller/src/modules/http/data/usecases/remote_http_post_usecase.dart';

import 'spy/http_client_spy.dart';
import '../mocks/http_params_fake.dart';
import '../mocks/responses/http_mock_response.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(HttpParamsFake());
  });

  group('Should test SignUp layer', () {
    late HttpParams params;
    late HttpClientSpy httpClientGet;
    late HttpClientSpy httpClientPost;
    late HttpGetUseCase httpGetUseCase;
    late HttpPostUseCase httPostUseCase;
    late Either<HttpException, Map<String, dynamic>> result;

    setUp(() {
      params = HttpParamsFake();
      result = HttpMockResponse.buildJsonSuccess();

      httpClientGet = HttpClientSpy()..mockGetSuccess(result);
      httpClientPost = HttpClientSpy()..mockPostSuccess(result);

      httpGetUseCase = RemoteHttpGetUseCase(httpClientGet);
      httPostUseCase = RemoteHttpPostUseCase(httpClientPost);
    });

    test('Should call HttpGetUseCase with correct values', () async {
      final value = await httpGetUseCase(params);

      expect(value.right.length, 1);
      expect(value.right.isEmpty, false);
    });

    test('Should call HttpPostUseCase with correct values', () async {
      final value = await httPostUseCase(params);

      expect(value.right.length, 1);
      expect(value.right.isEmpty, false);
    });
  });
}
