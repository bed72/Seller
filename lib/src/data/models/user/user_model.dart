import 'package:seller/src/domain/entities/user/user_entity.dart';

extension UserModel on UserEntity {
  static UserEntity fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      name: json['name'] ?? '',
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
      };
}
