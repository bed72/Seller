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

      final vaule = await _remoteConfig.fetchAndActivate();

      return Right(vaule);
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
      final response = _remoteConfig.getInt(key);
      final vaule = response != 0 ? response : defaultValue as int;

      return Right(vaule);
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
      final response = _remoteConfig.getBool(key);
      final vaule = response != false ? response : defaultValue as bool;

      return Right(vaule);
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
      final response = _remoteConfig.getString(key);
      final vaule = response.isNotEmpty ? response : defaultValue as String;

      return Right(vaule);
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
      final response = _remoteConfig.getDouble(key);
      final vaule = response != 0.0 ? response : defaultValue as double;

      return Right(vaule);
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
      final response = _remoteConfig.getValue(key);

      return Right(response);
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
