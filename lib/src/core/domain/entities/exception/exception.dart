import 'package:seller/src/modules/http/domain/helpers/http_helper.dart';

import 'package:seller/src/modules/storage/domain/helpers/storage_helper.dart';

import 'package:seller/src/modules/firabase/domain/helpers/remote_config_helper.dart';

abstract class HandleException implements Exception {}

class HttpException extends HandleException {
  late HttpResponse code;
  late final String message;

  HttpException({
    required this.code,
    required this.message,
  });
}

class RemoteConfigException extends HandleException {
  late final String message;
  late RemoteConfigResponse code;

  RemoteConfigException({
    required this.code,
    required this.message,
  });
}

class StorageException extends HandleException {
  late final String message;
  late StorageResponse code;

  StorageException({
    required this.code,
    required this.message,
  });
}

class NoConnectionException extends HandleException {
  late final String message;

  NoConnectionException({
    required this.message,
  });
}
