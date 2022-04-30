import 'package:seller/src/modules/auth/external/di/injection.dart';
import 'package:seller/src/modules/http/external/di/injection.dart';
import 'package:seller/src/modules/splash/external/di/injection.dart';
import 'package:seller/src/modules/storage/external/di/injection.dart';
import 'package:seller/src/modules/firabase/external/di/injection.dart';
import 'package:seller/src/modules/connectivity/external/di/injection.dart';

final providers = [
  ...storageModule,
  ...httpModule,
  ...connectivityModule,
  ...firebaseModule,
  ...splashModule,
  ...authModule,
];
