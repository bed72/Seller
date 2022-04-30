import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

abstract class StorageUsecase {
  Future<Either<StorageException, bool>> clear();
  Either<StorageException, String> get({required String key});
  Future<Either<StorageException, bool>> delete({required String key});
  Future<Either<StorageException, bool>> save({
    required String key,
    required String value,
  });
}
