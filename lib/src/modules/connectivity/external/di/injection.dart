import 'package:get_it/get_it.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:seller/src/core/external/di/module.dart';

import 'package:seller/src/modules/connectivity/domain/usecases/connectivity_usecase.dart';

import 'package:seller/src/modules/connectivity/external/adapter/connectivity_adapter.dart';

import 'package:seller/src/modules/connectivity/data/clients/connectivity_client.dart';
import 'package:seller/src/modules/connectivity/data/usecases/remote_connectivity_usecase.dart';

class ConnectivityModule implements Module {
  final GetIt locator;

  ConnectivityModule(this.locator);

  @override
  Future<void> initialized() async {
    locator
      ..registerSingleton<Connectivity>(
        Connectivity(),
      )
      ..registerLazySingleton<ConnectivityClient>(
        () => ConnectivityAdapter(
          locator.get<Connectivity>(),
        ),
      )
      ..registerLazySingleton<ConnectivityUseCase>(
        () => RemoteConnectivityUseCase(
          locator.get<ConnectivityClient>(),
        ),
      );
  }
}
