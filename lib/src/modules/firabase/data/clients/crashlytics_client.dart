abstract class CrashlyticsClient {
  void log(String message);
  void recordFlutterError();
  dynamic recordError(Object exception, StackTrace stack);
}
