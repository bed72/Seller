enum RemoteConfigError {
  force,
  intValue,
  boolValue,
  stringValue,
  doubleValue,
  dynamicValue
}

extension RemoteConfigErrorExtension on RemoteConfigError {
  String get descripition {
    switch (this) {
      case RemoteConfigError.force:
        return 'appHelperNotHaveData';
      case RemoteConfigError.intValue:
        return 'appHelperNotHaveData';
      case RemoteConfigError.boolValue:
        return 'appHelperNotHaveData';
      case RemoteConfigError.stringValue:
        return 'appHelperNotHaveData';
      case RemoteConfigError.doubleValue:
        return 'appHelperNotHaveData';
      case RemoteConfigError.dynamicValue:
        return 'appHelperNotHaveData';
      default:
        return 'appHelperGeneric';
    }
  }
}
