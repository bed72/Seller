abstract class RemoteConfigUseCase {
  Future<void> forceRefresh();

  int getInt({
    required String key,
    required dynamic defaultValue,
  });

  bool getBool({
    required String key,
    required dynamic defaultValue,
  });

  String getString({
    required String key,
    required dynamic defaultValue,
  });

  double getDouble({
    required String key,
    required dynamic defaultValue,
  });

  dynamic getValue({
    required String key,
    required dynamic defaultValue,
  });
}
