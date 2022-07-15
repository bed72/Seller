import 'package:mocktail/mocktail.dart';

import 'package:seller/src/modules/firabase/data/clients/crashlytics_client.dart';

class CrashlyticsUseCaseSpy extends Mock implements CrashlyticsClient {
  When mockRecordErrorCrashlytics() => when(() => recordError(
        'Object',
        StackTrace.empty,
      ));

  void mockRecordErrorSuccess(dynamic value) =>
      mockRecordErrorCrashlytics().thenAnswer((_) => value);

  void mockRecordErrorFailure(dynamic value) =>
      mockRecordErrorCrashlytics().thenThrow(value);
}
