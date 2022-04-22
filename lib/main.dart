import 'dart:async';

import 'package:provider/provider.dart';

import 'src/app.dart';

import 'package:flutter/material.dart';

import 'package:seller/src/modules/storage/external/singletons/storage_singleton.dart';

Future<void> main() async {
  await _initializedSharedPreferences();

  await runZonedGuarded<Future<void>>(
    () async {
      Provider.debugCheckInvalidValueType = null;

      runApp(const App());
    },
    (_, __) {},
  );
}

Future<void> _initializedSharedPreferences() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageSingleton.instance.init();
}
