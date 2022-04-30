import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

import 'package:seller/src/modules/storage/data/clients/storage_client.dart';

import 'package:seller/src/modules/storage/domain/usecases/storage_usecase.dart';

class RemoteStorageUsecase implements StorageUsecase {
  late final StorageClient _storageClient;

  RemoteStorageUsecase(this._storageClient);

  @override
  Future<Either<StorageException, bool>> clear() async =>
      await _storageClient.clear();

  @override
  Either<StorageException, String> get({required String key}) =>
      _storageClient.get(key);

  @override
  Future<Either<StorageException, bool>> save({
    required String key,
    required String value,
  }) async =>
      await _storageClient.save(key: key, value: value);

  @override
  Future<Either<StorageException, bool>> delete({required String key}) async =>
      await _storageClient.delete(key);
}
