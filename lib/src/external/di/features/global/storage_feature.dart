import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:seller/src/domain/usecases/storage/storage_usecase.dart';

import 'package:seller/src/external/adapters/storage/storage_adapter.dart';

import 'package:seller/src/data/clients/storage/storage_client.dart';
import 'package:seller/src/data/usecases/storage/remote_storage_usecase.dart';

void storageFeature(GetIt locator) {
  locator.registerLazySingletonAsync<SharedPreferences>(
    () async => await SharedPreferences.getInstance(),
  );

  locator.registerLazySingleton<StorageClient>(
    () => StorageAdapter(locator.get<SharedPreferences>()),
  );

  locator.registerLazySingleton<StorageUsecase>(
    () => RemoteStorageUsecase(locator.get<StorageClient>()),
  );
}
