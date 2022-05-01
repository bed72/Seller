import 'package:provider/provider.dart';

import 'package:seller/src/modules/splash/presentation/bloc/splash_bloc.dart';

import 'package:seller/src/modules/storage/domain/usecases/storage_usecase.dart';

import 'package:seller/src/modules/connectivity/domain/usecases/connectivity_usecase.dart';

final splashModule = [
  Provider<SplashBloc>(
    create: (context) => SplashBloc(
      context.read<StorageUseCase>(),
      context.read<ConnectivityUseCase>(),
    ),
  ),
];
