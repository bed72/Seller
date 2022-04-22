import 'package:seller/src/modules/auth/domain/entities/signup/signup_entity.dart';

extension SignUpModel on SignUpEntity {
  static SignUpEntity fromJson(Map<String, dynamic> json) {
    return SignUpEntity(
      expiresIn: json['expires_in'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }

  Map<String, dynamic> toJson() => {
        'expires_in': expiresIn,
        'access_token': accessToken,
        'refresh_token': refreshToken,
      };
}
