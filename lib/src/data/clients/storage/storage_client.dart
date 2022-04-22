abstract class StorageClient {
  Future<void> clear();
  Future<void> delete(String key);
  Future<String> fetch(String key);
  Future<void> save({
    required String key,
    required String value,
  });
}
