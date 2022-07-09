import 'package:mocktail/mocktail.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';
import 'package:seller/src/core/domain/entities/exception/exception.dart';

import 'package:seller/src/modules/http/data/clients/http_client.dart';
import 'package:seller/src/modules/http/domain/helpers/http_helper.dart';

class HttpClientSpy extends Mock implements HttpClient {
  When mockGet() => when(
        () => get(
          params: any(named: 'params'),
        ),
      );

  void mockRequestGetSuccess(
    Either<HttpException, Map<String, dynamic>> value,
  ) =>
      mockGet().thenAnswer((_) async => value.right);

  void mockRequestGetError(
    Either<HttpException, Map<String, dynamic>> value,
  ) =>
      mockGet().thenThrow(value.left);

  When mockPost() => when(
        () => post(
          params: any(named: 'params'),
        ),
      );

  void mockRequestPostSuccess(
    Either<HttpException, Map<String, dynamic>> value,
  ) =>
      mockPost().thenAnswer((_) async => value);

  void mockRequestPostError(
    Either<HttpException, Map<String, dynamic>> value,
  ) =>
      mockPost().thenThrow(value);
}
