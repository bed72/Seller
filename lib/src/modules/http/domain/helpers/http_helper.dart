enum HttpResponse {
  ok(''),
  success(''),
  notFound('httpNotFound'),
  forbidden('httpForbidden'),
  badRequest('httpBadRequest'),
  serverError('httpServerError'),
  unauthorized('httpUnauthorized');

  final String value;

  const HttpResponse(this.value);

  int get code {
    switch (this) {
      case HttpResponse.ok:
        return 200;
      case HttpResponse.success:
        return 204;
      case HttpResponse.notFound:
        return 404;
      case HttpResponse.forbidden:
        return 403;
      case HttpResponse.badRequest:
        return 400;
      case HttpResponse.serverError:
        return 500;
      case HttpResponse.unauthorized:
        return 401;
      default:
        return 500;
    }
  }
}

enum HttpMethod {
  get('get'),
  put('put'),
  post('post'),
  patch('patch'),
  delete('delete');

  final String value;

  const HttpMethod(this.value);
}
