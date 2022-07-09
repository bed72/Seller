import 'package:get_it/get_it.dart';

import 'package:seller/src/core/external/di/module.dart';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'package:seller/src/modules/firabase/domain/usecases/crashlytics_usecase.dart';
import 'package:seller/src/modules/firabase/domain/usecases/remote_config_usecase.dart';

import 'package:seller/src/modules/firabase/data/clients/crashlytics_client.dart';
import 'package:seller/src/modules/firabase/data/clients/remote_config_client.dart';
import 'package:seller/src/modules/firabase/data/usecases/remote_crashlytics_usecase.dart';
import 'package:seller/src/modules/firabase/data/usecases/remote_remote_config_usecase.dart';

import 'package:seller/src/modules/firabase/external/adapters/remote_config_adapter.dart';
import 'package:seller/src/modules/firabase/external/adapters/remote_crashlytics_adapter.dart';

class FirebaseModule implements Module {
  final GetIt locator;

  FirebaseModule(this.locator);

  @override
  Future<void> initialized() async {
    /// Remote Config
    locator
      ..registerSingleton<FirebaseRemoteConfig>(
        FirebaseRemoteConfig.instance,
      )
      ..registerLazySingleton<RemoteConfigClient>(
        () => RemoteConfigAdapter(
          locator.get<FirebaseRemoteConfig>(),
        ),
      )
      ..registerLazySingleton<RemoteConfigUseCase>(
        () => RemoteRemoteConfigUseCase(
          locator.get<RemoteConfigClient>(),
        ),
      );

    /// Crashlytics
    locator
      ..registerSingleton<FirebaseCrashlytics>(
        FirebaseCrashlytics.instance,
      )
      ..registerLazySingleton<CrashlyticsClient>(
        () => CrashlyticsAdapter(
          locator.get<FirebaseCrashlytics>(),
        ),
      )
      ..registerLazySingleton<CrashlyticsUseCase>(
        () => RemoteCrashlyticsUseCase(
          locator.get<CrashlyticsClient>(),
        ),
      );
  }
}
