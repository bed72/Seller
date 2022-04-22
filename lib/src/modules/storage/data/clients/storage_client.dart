abstract class StorageClient {
  Future<void> clear();
  Future<String> get(String key);
  Future<void> delete(String key);
  Future<void> save({
    required String key,
    required String value,
  });
}
