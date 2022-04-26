import 'package:seller/src/modules/http/domain/helpers/http_helper.dart';

abstract class HandleException implements Exception {}

class ServerException extends HandleException {
  late HttpResponse code;
  late final String message;

  ServerException({
    required this.code,
    required this.message,
  });
}

class DataParsingException extends HandleException {
  late final String message;

  DataParsingException({
    required this.message,
  });
}

class NoConnectionException extends HandleException {
  late final String message;

  NoConnectionException({
    required this.message,
  });
}
