import 'package:firebase_core/firebase_core.dart'
    show Firebase, FirebaseOptions;
import 'package:flutter/foundation.dart'
    show FlutterError, TargetPlatform, defaultTargetPlatform, kIsWeb;

import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:seller/src/modules/firabase/external/singletons/chashlytics_singleton.dart';
import 'package:seller/src/modules/firabase/external/singletons/remote_config_singleton.dart';

class FirebaseConfig {
  static startConfiguration() async {
    await _startFirebase();
    _startSingletons();

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'FirebaseConfig have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'FirebaseConfig have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'FirebaseConfig are not supported for this platform.',
        );
    }
  }

  static recordError(Object exception, StackTrace stack) =>
      FirebaseCrashlytics.instance.recordError(exception, stack);

  static _startFirebase() async {
    await Firebase.initializeApp(
      options: FirebaseConfig.currentPlatform,
    );
  }

  static _startSingletons() {
    CrashlyticsSingleton.instance.initialized();
    RemoteConfigSingleton.instance.initialized();
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyARHEop4O2IHX_qm5Kp3-1Hy3CF6Cp5g40',
    appId: '1:161515463548:android:8a54638590625baa09baf9',
    messagingSenderId: '161515463548',
    projectId: 'go-sale-seller',
    storageBucket: 'go-sale-seller.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKnmaVtkk-ysRZ-pZ0lln9vjSuHK3FJb4',
    appId: '1:161515463548:ios:5c09b6c66aa86edb09baf9',
    messagingSenderId: '161515463548',
    projectId: 'go-sale-seller',
    storageBucket: 'go-sale-seller.appspot.com',
    iosClientId:
        '161515463548-5epht53bfbeaemn5l4gr6e9suh22kdg5.apps.googleusercontent.com',
    iosBundleId: 'com.gosale.seller',
  );
}
