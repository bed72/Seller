import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:seller/src/modules/storage/domain/usecases/storage_usecase.dart';

import 'package:seller/src/modules/storage/data/clients/storage_client.dart';
import 'package:seller/src/modules/storage/data/usecases/remote_storage_usecase.dart';

import 'package:seller/src/modules/storage/external/adapters/storage_adapter.dart';
import 'package:seller/src/modules/storage/external/singletons/storage_singleton.dart';

final storageModule = [
  Provider<SharedPreferences>.value(
    value: StorageSingleton.instance.preferences,
  ),
  Provider<StorageClient>(
    create: (context) => StorageAdapter(
      context.read<SharedPreferences>(),
    ),
  ),
  Provider<StorageUseCase>(
    create: (context) => RemoteStorageUseCase(
      context.read<StorageClient>(),
    ),
  ),
];
