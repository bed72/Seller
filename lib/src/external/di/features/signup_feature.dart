import 'package:get_it/get_it.dart';

import 'package:seller/src/domain/usecases/signup/signup_usecase.dart';

import 'package:seller/src/data/clients/http/http_client.dart';
import 'package:seller/src/data/usecases/signup/remote_signup_usecase.dart';

import 'package:seller/src/presentation/screens/auth/signup/states/signup_logic.dart';

void signUpFeature(GetIt locator) {
  locator.registerLazySingleton<SignUpUseCase>(
    () => RemoteSignUpUseCase(locator.get<HttpClient>()),
  );

  locator.registerFactory<SignUpLogic>(
    () => SignUpLogic(
      locator.get<SignUpUseCase>(),
    ),
  );
}
