import 'package:flutter/services.dart';

import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'package:seller/src/modules/firabase/data/clients/remote_config_client.dart';

class RemoteConfigAdapter implements RemoteConfigClient {
  late final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigAdapter(this._remoteConfig);

  @override
  Future<void> forceRefresh() async {
    try {
      await remoteConfigSettings(
        minimumFetchInterval: const Duration(seconds: 0),
      );

      await _remoteConfig.fetchAndActivate();
    } on PlatformException catch (exception) {
      throw (exception.toString());
    } catch (exception) {
      throw ('Error to fetch data in Remote Config');
    }
  }

  @override
  int getInt(String key, defaultValue) {
    final _value = _remoteConfig.getInt(key);

    return _value != 0 ? _value : defaultValue;
  }

  @override
  bool getBool(String key, defaultValue) {
    final _value = _remoteConfig.getBool(key);

    return _value != false ? _value : defaultValue;
  }

  @override
  String getString(String key, defaultValue) {
    final _value = _remoteConfig.getString(key);

    return _value.isNotEmpty ? _value : defaultValue;
  }

  @override
  double getDouble(String key, defaultValue) {
    final _value = _remoteConfig.getDouble(key);

    return _value != 0.0 ? _value : defaultValue;
  }

  @override
  getValue(String key, defaultValue) => _remoteConfig.getValue(key);

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
