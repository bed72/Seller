import 'package:shared_preferences/shared_preferences.dart';

class StorageSingleton {
  late final SharedPreferences _preferences;

  StorageSingleton._();

  static final StorageSingleton _instance = StorageSingleton._();
  static StorageSingleton get instance => _instance;

  factory StorageSingleton() {
    return _instance;
  }

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  SharedPreferences get preferences => _preferences;
}
