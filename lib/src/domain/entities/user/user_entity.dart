import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String? name;
  final String email;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
  });

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
  }) =>
      UserEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        email,
      ];

  @override
  String toString() => '''
    {
      "id": "$id",
      "name": "$name",
      "email": "$email"
    }
  ''';
}
