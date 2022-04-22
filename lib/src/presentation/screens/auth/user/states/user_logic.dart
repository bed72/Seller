import 'package:flutter/foundation.dart';

import 'package:equatable/equatable.dart';

import 'package:seller/src/domain/entities/user/user_entity.dart';
import 'package:seller/src/domain/usecases/user/user_usecase.dart';

part 'user_state.dart';

class UserLogic extends ValueNotifier<UserState> {
  late final UserUseCase _userUseCase;

  UserLogic(this._userUseCase) : super(UserInitialState());

  Future<void> getUser(UserParams params) async {
    value = UserLoadingState();

    try {
      final _response = await _userUseCase.getUser(params);

      value = UserSuccessState(_response);
    } catch (error) {
      value = UserFailureState(error.toString());
    }
  }
}
