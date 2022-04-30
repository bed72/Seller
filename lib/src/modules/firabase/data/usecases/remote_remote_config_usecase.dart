import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

import 'package:seller/src/modules/firabase/data/clients/remote_config_client.dart';
import 'package:seller/src/modules/firabase/domain/usecases/remote_config_usecase.dart';

class RemoteRemoteConfigUseCase implements RemoteConfigUseCase {
  late final RemoteConfigClient _remoteConfigClient;

  RemoteRemoteConfigUseCase(this._remoteConfigClient);

  @override
  Future<Either<RemoteConfigException, bool>> forceRefresh() async =>
      await _remoteConfigClient.forceRefresh();

  @override
  Either<RemoteConfigException, int> getInt({
    required String key,
    required defaultValue,
  }) =>
      _remoteConfigClient.getInt(key, defaultValue);

  @override
  Either<RemoteConfigException, bool> getBool({
    required String key,
    required defaultValue,
  }) =>
      _remoteConfigClient.getBool(key, defaultValue);

  @override
  Either<RemoteConfigException, String> getString({
    required String key,
    required defaultValue,
  }) =>
      _remoteConfigClient.getString(key, defaultValue);

  @override
  Either<RemoteConfigException, double> getDouble({
    required String key,
    required defaultValue,
  }) =>
      _remoteConfigClient.getDouble(key, defaultValue);

  @override
  Either<RemoteConfigException, dynamic> getValue({
    required String key,
    required defaultValue,
  }) =>
      _remoteConfigClient.getValue(key, defaultValue);
}
