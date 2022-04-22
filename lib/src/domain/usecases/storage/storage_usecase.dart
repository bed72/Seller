abstract class StorageUsecase {
  Future<void> clear();
  Future<void> delete({required String key});
  Future<String> fetch({required String key});
  Future<void> save({
    required String key,
    required String value,
  });
}
