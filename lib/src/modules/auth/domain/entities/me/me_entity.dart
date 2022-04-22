import 'package:equatable/equatable.dart';

class MeEntity extends Equatable {
  final String id;
  final String? name;
  final String email;

  const MeEntity({
    required this.id,
    required this.name,
    required this.email,
  });

  MeEntity copyWith({
    String? id,
    String? name,
    String? email,
  }) =>
      MeEntity(
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
