import 'package:mocktail/mocktail.dart';

import 'package:seller/src/modules/http/data/clients/http_client.dart';

import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

class SignUpSpy extends Mock implements HttpClient {
  When mockSigUp() => when(() => post(params: any(named: 'params')));

  void mockSuccess(Either<HttpException, Map<String, dynamic>> value) =>
      mockSigUp().thenAnswer((_) async => value);

  void mockError(Either<HttpException, Map<String, dynamic>> value) =>
      mockSigUp().thenAnswer((_) async => value);
}
