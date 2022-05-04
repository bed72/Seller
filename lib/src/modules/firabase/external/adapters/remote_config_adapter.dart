import 'package:flutter/services.dart';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:seller/src/core/domain/entities/either/left_entity.dart';
import 'package:seller/src/core/domain/entities/either/right_entity.dart';

import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

import 'package:seller/src/modules/firabase/data/clients/remote_config_client.dart';
import 'package:seller/src/modules/firabase/domain/helpers/remote_config_helper.dart';

class RemoteConfigAdapter implements RemoteConfigClient {
  late final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigAdapter(this._remoteConfig) {
    forceRefresh();
  }

  @override
  Future<Either<RemoteConfigException, bool>> forceRefresh() async {
    try {
      await remoteConfigSettings(
        minimumFetchInterval: const Duration(seconds: 0),
      );

      final _vaule = await _remoteConfig.fetchAndActivate();

      return Right(_vaule);
    } on PlatformException catch (exception) {
      return Left(
        RemoteConfigException(
          message: exception.toString(),
          code: RemoteConfigResponse.force,
        ),
      );
    } catch (exception) {
      return Left(
        RemoteConfigException(
          message: exception.toString(),
          code: RemoteConfigResponse.force,
        ),
      );
    }
  }

  @override
  Either<RemoteConfigException, int> getInt(String key, defaultValue) {
    try {
      final _response = _remoteConfig.getInt(key);
      final _vaule = _response != 0 ? _response : defaultValue as int;

      return Right(_vaule);
    } catch (exception) {
      return Left(
        RemoteConfigException(
          message: exception.toString(),
          code: RemoteConfigResponse.intValue,
        ),
      );
    }
  }

  @override
  Either<RemoteConfigException, bool> getBool(String key, defaultValue) {
    try {
      final _response = _remoteConfig.getBool(key);
      final _vaule = _response != false ? _response : defaultValue as bool;

      return Right(_vaule);
    } catch (exception) {
      return Left(
        RemoteConfigException(
          message: exception.toString(),
          code: RemoteConfigResponse.boolValue,
        ),
      );
    }
  }

  @override
  Either<RemoteConfigException, String> getString(String key, defaultValue) {
    try {
      final _response = _remoteConfig.getString(key);
      final _vaule = _response.isNotEmpty ? _response : defaultValue as String;

      return Right(_vaule);
    } catch (exception) {
      return Left(
        RemoteConfigException(
          message: exception.toString(),
          code: RemoteConfigResponse.stringValue,
        ),
      );
    }
  }

  @override
  Either<RemoteConfigException, double> getDouble(String key, defaultValue) {
    try {
      final _response = _remoteConfig.getDouble(key);
      final _vaule = _response != 0.0 ? _response : defaultValue as double;

      return Right(_vaule);
    } catch (exception) {
      return Left(
        RemoteConfigException(
          message: exception.toString(),
          code: RemoteConfigResponse.doubleValue,
        ),
      );
    }
  }

  @override
  Either<RemoteConfigException, dynamic> getValue(String key, defaultValue) {
    try {
      final _response = _remoteConfig.getValue(key);

      return Right(_response);
    } catch (exception) {
      return Left(
        RemoteConfigException(
          message: exception.toString(),
          code: RemoteConfigResponse.dynamicValue,
        ),
      );
    }
  }

  @override
  Future<void> remoteConfigSettings({
    Duration fetchTimeout = const Duration(seconds: 8),
    Duration minimumFetchInterval = const Duration(seconds: 60),
  }) async =>
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: fetchTimeout,
          minimumFetchInterval: minimumFetchInterval,
        ),
      );
}
