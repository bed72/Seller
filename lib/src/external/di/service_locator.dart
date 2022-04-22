import 'package:get_it/get_it.dart';

import 'package:seller/src/external/di/features/user_feature.dart';
import 'package:seller/src/external/di/features/signup_feature.dart';

import 'package:seller/src/external/di/features/global/http_feature.dart';
import 'package:seller/src/external/di/features/global/storage_feature.dart';

class ServiceLocator {
  ServiceLocator.initializedInjectDependencies() {
    GetIt _locator = GetIt.instance;

    storageFeature(_locator);
    httpFeature(_locator);

    signUpFeature(_locator);
    userFeature(_locator);
  }
}
