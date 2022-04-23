import 'package:provider/provider.dart';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'package:seller/src/modules/firabase/domain/usecases/crashlytics_usecase.dart';
import 'package:seller/src/modules/firabase/domain/usecases/remote_config_usecase.dart';

import 'package:seller/src/modules/firabase/data/clients/crashlytics_client.dart';
import 'package:seller/src/modules/firabase/data/clients/remote_config_client.dart';

import 'package:seller/src/modules/firabase/data/usecases/remote_remote_config_usecase.dart';
import 'package:seller/src/modules/firabase/data/usecases/remote_crashlytics_usecase.dart';

import 'package:seller/src/modules/firabase/external/singletons/chashlytics_singleton.dart';
import 'package:seller/src/modules/firabase/external/singletons/remote_config_singleton.dart';

import 'package:seller/src/modules/firabase/external/adapters/remote_config_adapter.dart';
import 'package:seller/src/modules/firabase/external/adapters/remote_crashlytics_adapter.dart';

final firebaseModule = [
  /// Remote Config
  Provider<FirebaseRemoteConfig>.value(
    value: RemoteConfigSingleton.instance.remoteConfig,
  ),
  Provider<RemoteConfigClient>(
    create: (context) => RemoteConfigAdapter(
      context.read<FirebaseRemoteConfig>(),
    ),
  ),
  Provider<RemoteConfigUseCase>(
    create: (context) => RemoteRemoteConfigUseCase(
      context.read<RemoteConfigClient>(),
    ),
  ),

  /// Crashlytics
  Provider<FirebaseCrashlytics>.value(
    value: CrashlyticsSingleton.instance.crashlytics,
  ),
  Provider<CrashlyticsClient>(
    create: (context) => CrashlyticsAdapter(
      context.read<FirebaseCrashlytics>(),
    ),
  ),
  Provider<CrashlyticsUseCase>(
    create: (context) => RemoteCrashlyticsUseCase(
      context.read<CrashlyticsClient>(),
    ),
  ),
];
