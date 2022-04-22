import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  final int expiresIn;
  final String accessToken;
  final String refreshToken;

  const SignUpEntity({
    required this.expiresIn,
    required this.accessToken,
    required this.refreshToken,
  });

  SignUpEntity copyWith({
    int? expiresIn,
    String? accessToken,
    String? refreshToken,
  }) =>
      SignUpEntity(
        expiresIn: expiresIn ?? this.expiresIn,
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  @override
  List<Object?> get props => [
        expiresIn,
        accessToken,
        refreshToken,
      ];

  @override
  String toString() => '''
    {
      "expiresIn": "$expiresIn",
      "accessToken": "$accessToken",
      "refreshToken": "$refreshToken"
    }
  ''';
}
