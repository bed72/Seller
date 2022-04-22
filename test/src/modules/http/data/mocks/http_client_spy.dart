import 'package:mocktail/mocktail.dart';

import 'package:seller/src/modules/http/data/clients/http_client.dart';
import 'package:seller/src/modules/http/domain/helpers/http_helper.dart';

class HttpClientSpy extends Mock implements HttpClient {
  late final HttpMethod _method;

  HttpClientSpy({HttpMethod method = HttpMethod.post}) {
    _method = method;
  }

  When mockRequestCall() => when(
        () => call(
          method: _method,
          url: any(named: 'url'),
          body: any(named: 'body'),
          headers: any(named: 'headers'),
        ),
      );

  void mockRequest(dynamic data) =>
      mockRequestCall().thenAnswer((_) async => data);

  void mockRequestError(HttpResponse status) =>
      mockRequestCall().thenThrow(status);
}
