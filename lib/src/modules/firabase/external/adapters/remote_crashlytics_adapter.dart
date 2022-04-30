import 'package:flutter/foundation.dart';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:seller/src/modules/firabase/data/clients/crashlytics_client.dart';

class CrashlyticsAdapter implements CrashlyticsClient {
  late final FirebaseCrashlytics _crashlytics;

  CrashlyticsAdapter(this._crashlytics) {
    recordFlutterError();
  }

  @override
  void log(String message) {
    _crashlytics.log(message);
  }

  @override
  recordError(Object exception, StackTrace stack) {
    _crashlytics.recordError(exception, stack);
  }

  @override
  void recordFlutterError() {
    FlutterError.onError = _crashlytics.recordFlutterError;
  }
}
