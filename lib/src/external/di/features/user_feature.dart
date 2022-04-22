import 'package:get_it/get_it.dart';

import 'package:seller/src/domain/usecases/user/user_usecase.dart';

import 'package:seller/src/data/clients/http/http_client.dart';
import 'package:seller/src/data/usecases/user/remote_user_usecase.dart';

import 'package:seller/src/presentation/screens/auth/user/states/user_logic.dart';

void userFeature(GetIt locator) {
  locator.registerLazySingleton<UserUseCase>(
    () => RemoteUserUseCase(locator.get<HttpClient>()),
  );

  locator.registerFactory<UserLogic>(
    () => UserLogic(locator.get<UserUseCase>()),
  );
}
