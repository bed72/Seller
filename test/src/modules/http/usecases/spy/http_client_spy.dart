import 'package:mocktail/mocktail.dart';

import 'package:seller/src/modules/http/data/clients/http_client.dart';

import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

class HttpClientSpy extends Mock implements HttpClient {
  When mockGet() => when(() => get(params: any(named: 'params')));

  void mockGetSuccess(Either<HttpException, Map<String, dynamic>> value) =>
      mockGet().thenAnswer((_) async => value);

  void mockGetError(Either<HttpException, Map<String, dynamic>> value) =>
      mockGet().thenThrow(value.left);

  When mockPost() => when(() => post(params: any(named: 'params')));

  void mockPostSuccess(Either<HttpException, Map<String, dynamic>> value) =>
      mockPost().thenAnswer((_) async => value);

  void mockPostError(Either<HttpException, Map<String, dynamic>> value) =>
      mockPost().thenThrow(value);
}
