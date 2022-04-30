enum RemoteConfigResponse {
  force,
  intValue,
  boolValue,
  stringValue,
  doubleValue,
  dynamicValue
}

extension RemoteConfigResponseExtension on RemoteConfigResponse {
  String get value {
    switch (this) {
      case RemoteConfigResponse.force:
        return 'helperNotHaveData';
      case RemoteConfigResponse.intValue:
        return 'helperNotHaveData';
      case RemoteConfigResponse.boolValue:
        return 'helperNotHaveData';
      case RemoteConfigResponse.stringValue:
        return 'helperNotHaveData';
      case RemoteConfigResponse.doubleValue:
        return 'helperNotHaveData';
      case RemoteConfigResponse.dynamicValue:
        return 'helperNotHaveData';
      default:
        return 'helperGeneric';
    }
  }
}
