abstract class StorageUsecase {
  Future<void> clear();
  Future<String> get({required String key});
  Future<void> delete({required String key});
  Future<void> save({
    required String key,
    required String value,
  });
}
