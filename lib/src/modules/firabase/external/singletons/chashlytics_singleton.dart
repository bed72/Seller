import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashlyticsSingleton {
  late final FirebaseCrashlytics _crashlytics;

  CrashlyticsSingleton._();

  static final CrashlyticsSingleton _instance = CrashlyticsSingleton._();
  static CrashlyticsSingleton get instance => _instance;

  factory CrashlyticsSingleton() => _instance;

  void initialized() {
    _crashlytics = FirebaseCrashlytics.instance;

    FirebaseCrashlytics.instance;
  }

  FirebaseCrashlytics get crashlytics => _crashlytics;
}
