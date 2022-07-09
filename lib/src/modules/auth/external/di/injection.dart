import 'package:get_it/get_it.dart';

import 'package:seller/src/core/external/di/module.dart';

import 'package:seller/src/modules/http/data/clients/http_client.dart';

import 'package:seller/src/modules/auth/domain/usecases/me/me_usecase.dart';
import 'package:seller/src/modules/auth/domain/usecases/signup/signup_usecase.dart';

import 'package:seller/src/modules/firabase/domain/usecases/crashlytics_usecase.dart';

import 'package:seller/src/modules/auth/data/usecases/me/remote_me_usecase.dart';
import 'package:seller/src/modules/auth/data/usecases/signup/remote_signup_usecase.dart';

import 'package:seller/src/modules/auth/presentation/screens/auth/me/bloc/me_bloc.dart';
import 'package:seller/src/modules/auth/presentation/screens/auth/signup/bloc/signup_bloc.dart';

class AuthModule implements Module {
  final GetIt locator;

  AuthModule(this.locator);

  @override
  Future<void> initialized() async {
    /// SignUp
    locator
      ..registerLazySingleton<SignUpUseCase>(
        () => RemoteSignUpUseCase(
          locator.get<HttpClient>(),
        ),
      )
      ..registerFactory<SignupBloc>(
        () => SignupBloc(
          locator.get<SignUpUseCase>(),
          locator.get<CrashlyticsUseCase>(),
        ),
      );

    // Me
    locator
      ..registerLazySingleton<MeUseCase>(
        () => RemoteMeUseCase(
          locator.get<HttpClient>(),
        ),
      )
      ..registerFactory<MeBloc>(
        () => MeBloc(
          locator.get<MeUseCase>(),
          locator.get<CrashlyticsUseCase>(),
        ),
      );
  }
}
