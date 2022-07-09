enum RemoteConfigResponse {
  force('helperNotHaveData'),
  intValue('helperNotHaveData'),
  boolValue('helperNotHaveData'),
  stringValue('helperNotHaveData'),
  doubleValue('helperNotHaveData'),
  dynamicValue('helperNotHaveData');

  final String value;

  const RemoteConfigResponse(this.value);
}
