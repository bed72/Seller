import 'package:seller/src/domain/helpers/http_helper.dart';

abstract class HttpClient {
  Future<Map<String, dynamic>> call({
    required String url,
    required HttpMethod method,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });
}
