import 'dart:async';

import 'package:flutter/material.dart';

import 'src/app.dart';

import 'package:seller/src/core/external/configs/start_config.dart';

Future<void> main() async => await runZonedGuarded<Future<void>>(
      () async {
        await startApplicationDependencies();

        runApp(const App());
      },
      (Object exception, StackTrace stack) => recordError(exception, stack),
    );
