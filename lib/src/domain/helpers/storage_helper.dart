enum StorageError {
  unexpected,
  notHaveDataStorage,
}

extension StorageErrorExtension on StorageError {
  String get descripition {
    switch (this) {
      case StorageError.notHaveDataStorage:
        return 'appHelperNotHaveData';
      default:
        return 'appHelperGeneric';
    }
  }
}
