import 'package:seller/src/modules/auth/domain/entities/me/me_entity.dart';

extension MeModel on MeEntity {
  static MeEntity fromJson(Map<String, dynamic> json) {
    return MeEntity(
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
