import 'package:shared_preferences/shared_preferences.dart';

import 'package:seller/src/data/clients/storage/storage_client.dart';

class StorageAdapter implements StorageClient {
  late final SharedPreferences _storage;

  StorageAdapter(this._storage);

  @override
  Future<void> clear() async {
    await _storage.clear();
  }

  @override
  Future<void> delete(String key) async {
    await _storage.remove(key);
  }

  @override
  Future<String> fetch(String key) async {
    return _storage.getString(key) ?? '';
  }

  @override
  Future<void> save({
    required String key,
    required String value,
  }) async {
    await _storage.remove(key);
    await _storage.setString(key, value);
  }
}
