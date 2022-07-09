import 'package:get_it/get_it.dart';

import 'package:flutter/widgets.dart';
import 'package:seller/src/core/external/di/injection.dart';

import 'package:seller/src/modules/firabase/external/configs/firebase_config.dart';

Future<void> startApplicationDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseConfig.configurationInitialized();
  await ServiceLocator(GetIt.instance).initialized();
}

dynamic recordError(Object exception, StackTrace stack) =>
    FirebaseConfig.recordError(exception, stack);
