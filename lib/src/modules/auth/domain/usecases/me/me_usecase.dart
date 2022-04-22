import 'package:seller/src/modules/auth/domain/entities/me/me_entity.dart';

abstract class MeUseCase {
  Future<MeEntity> getMe(MeParams params);
}

class MeParams {
  final String url;

  const MeParams({
    required this.url,
  });
}
