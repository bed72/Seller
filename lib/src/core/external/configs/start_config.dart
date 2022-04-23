import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';

import 'package:seller/src/modules/firabase/external/configs/firebase_config.dart';

import 'package:seller/src/modules/storage/external/singletons/storage_singleton.dart';

Future<void> startApplicationDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;

  await _startSingletons();
  await _startConfigurationFirebase();
}

Future<void> _startSingletons() async {
  await StorageSingleton.instance.initialized();
}

Future<void> _startConfigurationFirebase() async {
  await FirebaseConfig.startConfiguration();
}

dynamic recordError(Object exception, StackTrace stack) =>
    FirebaseConfig.recordError(exception, stack);
