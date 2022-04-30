import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

abstract class RemoteConfigClient {
  Future<Either<RemoteConfigException, bool>> forceRefresh();

  Either<RemoteConfigException, int> getInt(String key, dynamic defaultValue);
  Either<RemoteConfigException, bool> getBool(String key, dynamic defaultValue);
  Either<RemoteConfigException, String> getString(
    String key,
    dynamic defaultValue,
  );
  Either<RemoteConfigException, double> getDouble(
    String key,
    dynamic defaultValue,
  );
  Either<RemoteConfigException, dynamic> getValue(
      String key, dynamic defaultValue);

  Future<void> remoteConfigSettings({
    Duration fetchTimeout = const Duration(seconds: 8),
    Duration minimumFetchInterval = const Duration(seconds: 60),
  });
}
