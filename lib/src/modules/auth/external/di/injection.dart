import 'package:provider/provider.dart';

import 'package:seller/src/modules/http/data/clients/http_client.dart';

import 'package:seller/src/modules/auth/domain/usecases/me/me_usecase.dart';
import 'package:seller/src/modules/auth/domain/usecases/signup/signup_usecase.dart';

import 'package:seller/src/modules/firabase/domain/usecases/crashlytics_usecase.dart';

import 'package:seller/src/modules/auth/data/usecases/me/remote_me_usecase.dart';
import 'package:seller/src/modules/auth/data/usecases/signup/remote_signup_usecase.dart';

import 'package:seller/src/modules/auth/presentation/screens/auth/me/states/me_logic.dart';
import 'package:seller/src/modules/auth/presentation/screens/auth/signup/states/signup_logic.dart';

final authModule = [
  /// SignUp
  Provider<SignUpUseCase>(
    create: (context) => RemoteSignUpUseCase(
      context.read<HttpClient>(),
    ),
  ),
  Provider<SignUpLogic>(
    create: (context) => SignUpLogic(
      context.read<SignUpUseCase>(),
    ),
  ),

  /// Me
  Provider<MeUseCase>(
    create: (context) => RemoteMeUseCase(
      context.read<HttpClient>(),
    ),
  ),

  Provider<MeLogic>(
    create: (context) => MeLogic(
      context.read<MeUseCase>(),
      context.read<CrashlyticsUseCase>(),
    ),
  ),
];