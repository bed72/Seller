import 'package:shared_preferences/shared_preferences.dart';

import 'package:seller/src/core/domain/entities/either/left_entity.dart';
import 'package:seller/src/core/domain/entities/either/right_entity.dart';
import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

import 'package:seller/src/modules/storage/data/clients/storage_client.dart';

import 'package:seller/src/modules/storage/domain/helpers/storage_helper.dart';

class StorageAdapter implements StorageClient {
  late final SharedPreferences _storage;

  StorageAdapter(this._storage);

  @override
  Future<Either<StorageException, bool>> clear() async {
    try {
      final _response = await _storage.clear();

      return Right(_response);
    } catch (exception) {
      return Left(
        StorageException(
          code: StorageResponse.clear,
          message: exception.toString(),
        ),
      );
    }
  }

  @override
  Either<StorageException, String> get(String key) {
    try {
      final _response = _storage.getString(key) ?? '';

      return Right(_response);
    } catch (exception) {
      return Left(
        StorageException(
          code: StorageResponse.get,
          message: exception.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<StorageException, bool>> delete(String key) async {
    try {
      final _response = await _storage.remove(key);

      return Right(_response);
    } catch (exception) {
      return Left(
        StorageException(
          code: StorageResponse.delete,
          message: exception.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<StorageException, bool>> save({
    required String key,
    required String value,
  }) async {
    try {
      await _storage.remove(key);
      final _response = await _storage.setString(key, value);

      return Right(_response);
    } catch (exception) {
      return Left(
        StorageException(
          code: StorageResponse.save,
          message: exception.toString(),
        ),
      );
    }
  }
}
