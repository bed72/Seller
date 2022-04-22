import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/app.dart';

import 'package:seller/src/external/di/service_locator.dart';

Future<void> main() async {
  _initializedServiceLocator();

  await runZonedGuarded<Future<void>>(
    () async => GetIt.instance.isReady<SharedPreferences>().then((_) {
      runApp(const App());
    }),
    (_, __) {},
  );
}

void _initializedServiceLocator() {
  WidgetsFlutterBinding.ensureInitialized();

  ServiceLocator.initializedInjectDependencies();
}
