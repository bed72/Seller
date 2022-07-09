import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

abstract class RemoteConfigUseCase {
  Future<Either<RemoteConfigException, bool>> forceRefresh();

  Either<RemoteConfigException, int> getInt({
    required String key,
    required dynamic defaultValue,
  });

  Either<RemoteConfigException, bool> getBool({
    required String key,
    required dynamic defaultValue,
  });

  Either<RemoteConfigException, String> getString({
    required String key,
    required dynamic defaultValue,
  });

  Either<RemoteConfigException, double> getDouble({
    required String key,
    required dynamic defaultValue,
  });

  Either<RemoteConfigException, dynamic> getValue({
    required String key,
    required dynamic defaultValue,
  });
}
