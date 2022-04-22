import 'package:seller/src/domain/entities/user/user_entity.dart';

abstract class UserUseCase {
  Future<UserEntity> getUser(UserParams params);
}

class UserParams {
  final String url;

  const UserParams({
    required this.url,
  });
}
