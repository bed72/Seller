import 'package:get_it/get_it.dart';

import 'package:seller/src/core/external/di/module.dart';

import 'package:seller/src/modules/auth/external/di/injection.dart';
import 'package:seller/src/modules/http/external/di/injection.dart';
import 'package:seller/src/modules/splash/external/di/injection.dart';
import 'package:seller/src/modules/storage/external/di/injection.dart';
import 'package:seller/src/modules/firabase/external/di/injection.dart';
import 'package:seller/src/modules/connectivity/external/di/injection.dart';

class ServiceLocator implements Module {
  final GetIt locator;

  ServiceLocator(this.locator);

  @override
  Future<void> initialized() async {
    FirebaseModule(locator).initialized();
    StorageModule(locator).initialized();
    HttpModule(locator).initialized();
    ConnectivityModule(locator).initialized();
    SplashModule(locator).initialized();
    AuthModule(locator).initialized();
  }
}
