import 'package:provider/provider.dart';

import 'package:seller/src/modules/splash/presentation/states/splash_logic.dart';

import 'package:seller/src/modules/storage/domain/usecases/storage_usecase.dart';

import 'package:seller/src/modules/connectivity/domain/usecases/connectivity_usecase.dart';

final splashModule = [
  Provider<SplashLogic>(
    create: (context) => SplashLogic(
      context.read<StorageUsecase>(),
      context.read<ConnectivityUseCase>(),
    ),
  ),
];
