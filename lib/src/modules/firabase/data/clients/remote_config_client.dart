abstract class RemoteConfigClient {
  Future<void> forceRefresh();

  int getInt(String key, dynamic defaultValue);
  bool getBool(String key, dynamic defaultValue);
  String getString(String key, dynamic defaultValue);
  double getDouble(String key, dynamic defaultValue);
  dynamic getValue(String key, dynamic defaultValue);

  Future<void> remoteConfigSettings({
    Duration fetchTimeout = const Duration(seconds: 8),
    Duration minimumFetchInterval = const Duration(seconds: 60),
  });
}
