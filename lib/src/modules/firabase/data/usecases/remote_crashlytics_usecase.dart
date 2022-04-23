import 'package:seller/src/modules/firabase/data/clients/crashlytics_client.dart';
import 'package:seller/src/modules/firabase/domain/usecases/crashlytics_usecase.dart';

class RemoteCrashlyticsUseCase implements CrashlyticsUseCase {
  late final CrashlyticsClient _crashlyticsClient;

  RemoteCrashlyticsUseCase(this._crashlyticsClient);

  @override
  void log({required String message}) {
    _crashlyticsClient.log(message);
  }

  @override
  recordError({required Object exception, required StackTrace stack}) {
    _crashlyticsClient.recordError(exception, stack);
  }
}
