import 'package:seller/src/modules/storage/data/clients/storage_client.dart';

import 'package:seller/src/modules/storage/domain/helpers/storage_helper.dart';
import 'package:seller/src/modules/storage/domain/usecases/storage_usecase.dart';

class RemoteStorageUsecase implements StorageUsecase {
  late final StorageClient _storageClient;

  RemoteStorageUsecase(this._storageClient);

  @override
  Future<String> get({required String key}) async {
    try {
      return await _storageClient.get(key);
    } catch (error) {
      throw StorageError.unexpected;
    }
  }

  @override
  Future<void> save({required String key, required String value}) async {
    try {
      await _storageClient.save(key: key, value: value);
    } catch (error) {
      throw StorageError.unexpected;
    }
  }

  @override
  Future<void> delete({required String key}) async {
    try {
      await _storageClient.delete(key);
    } catch (error) {
      throw StorageError.unexpected;
    }
  }

  @override
  Future<void> clear() async {
    try {
      await _storageClient.clear();
    } catch (error) {
      throw StorageError.unexpected;
    }
  }
}
