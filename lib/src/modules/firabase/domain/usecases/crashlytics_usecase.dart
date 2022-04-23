abstract class CrashlyticsUseCase {
  void log({required String message});
  dynamic recordError({
    required Object exception,
    required StackTrace stack,
  });
}
