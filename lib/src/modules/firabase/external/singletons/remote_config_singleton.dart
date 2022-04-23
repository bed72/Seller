import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigSingleton {
  late final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigSingleton._();

  static final RemoteConfigSingleton _instance = RemoteConfigSingleton._();
  static RemoteConfigSingleton get instance => _instance;

  factory RemoteConfigSingleton() => _instance;

  void initialized() {
    _remoteConfig = FirebaseRemoteConfig.instance;

    FirebaseRemoteConfig.instance;
  }

  FirebaseRemoteConfig get remoteConfig => _remoteConfig;
}
