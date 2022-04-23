import 'package:seller/src/modules/firabase/data/clients/remote_config_client.dart';
import 'package:seller/src/modules/firabase/domain/helpers/remote_config_helper.dart';
import 'package:seller/src/modules/firabase/domain/usecases/remote_config_usecase.dart';

class RemoteRemoteConfigUseCase implements RemoteConfigUseCase {
  late final RemoteConfigClient _remoteConfigClient;

  RemoteRemoteConfigUseCase(this._remoteConfigClient);

  @override
  Future<void> forceRefresh() async {
    try {
      await _remoteConfigClient.forceRefresh();
    } catch (_) {
      throw RemoteConfigError.force;
    }
  }

  @override
  int getInt({required String key, required defaultValue}) {
    try {
      return _remoteConfigClient.getInt(key, defaultValue);
    } catch (_) {
      throw RemoteConfigError.intValue;
    }
  }

  @override
  bool getBool({required String key, required defaultValue}) {
    try {
      return _remoteConfigClient.getBool(key, defaultValue);
    } catch (_) {
      throw RemoteConfigError.boolValue;
    }
  }

  @override
  String getString({required String key, required defaultValue}) {
    try {
      return _remoteConfigClient.getString(key, defaultValue);
    } catch (_) {
      throw RemoteConfigError.stringValue;
    }
  }

  @override
  double getDouble({required String key, required defaultValue}) {
    try {
      return _remoteConfigClient.getDouble(key, defaultValue);
    } catch (_) {
      throw RemoteConfigError.doubleValue;
    }
  }

  @override
  getValue({required String key, required defaultValue}) {
    try {
      return _remoteConfigClient.getValue(key, defaultValue);
    } catch (_) {
      throw RemoteConfigError.dynamicValue;
    }
  }
}
