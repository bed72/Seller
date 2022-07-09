import 'package:get_it/get_it.dart';

import 'package:seller/src/core/external/di/module.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:seller/src/modules/storage/domain/usecases/storage_usecase.dart';

import 'package:seller/src/modules/storage/external/adapters/storage_adapter.dart';

import 'package:seller/src/modules/storage/data/clients/storage_client.dart';
import 'package:seller/src/modules/storage/data/usecases/remote_storage_usecase.dart';

class StorageModule implements Module {
  final GetIt locator;

  StorageModule(this.locator);

  @override
  Future<void> initialized() async {
    locator
      ..registerSingleton<SharedPreferences>(
        await SharedPreferences.getInstance(),
      )
      ..registerLazySingleton<StorageClient>(
        () => StorageAdapter(
          locator.get<SharedPreferences>(),
        ),
      )
      ..registerLazySingleton<StorageUseCase>(
        () => RemoteStorageUseCase(
          locator.get<StorageClient>(),
        ),
      );
  }
}
