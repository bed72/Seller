import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/right_entity.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

class HttpMockResponse {
  static Either<HttpException, Map<String, dynamic>> buildJsonSuccess() =>
      const Right({'response': 'ok'});
}
