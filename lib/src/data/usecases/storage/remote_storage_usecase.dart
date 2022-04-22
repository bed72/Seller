import 'package:seller/src/domain/helpers/storage_helper.dart';

import 'package:seller/src/data/clients/storage/storage_client.dart';

import 'package:seller/src/domain/usecases/storage/storage_usecase.dart';

class RemoteStorageUsecase implements StorageUsecase {
  late final StorageClient _storageClient;

  RemoteStorageUsecase(this._storageClient);

  @override
  Future<String> fetch({required String key}) async {
    try {
      return await _storageClient.fetch(key);
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
