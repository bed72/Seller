import 'package:equatable/equatable.dart';

class HttpParams extends Equatable {
  final String url;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? header;

  const HttpParams({
    this.body,
    this.header,
    required this.url,
  });

  @override
  List<Object?> get props => [url, body, header];
}
