import 'package:get_it/get_it.dart';

import 'package:seller/src/core/external/di/module.dart';

import 'package:seller/src/modules/splash/presentation/bloc/splash_bloc.dart';

import 'package:seller/src/modules/storage/domain/usecases/storage_usecase.dart';

import 'package:seller/src/modules/connectivity/domain/usecases/connectivity_usecase.dart';

class SplashModule implements Module {
  final GetIt locator;

  SplashModule(this.locator);

  @override
  Future<void> initialized() async {
    locator.registerFactory<SplashBloc>(
      () => SplashBloc(
        locator.get<StorageUseCase>(),
        locator.get<ConnectivityUseCase>(),
      ),
    );
  }
}
