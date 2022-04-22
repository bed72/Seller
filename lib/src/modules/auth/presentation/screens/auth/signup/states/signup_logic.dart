import 'package:flutter/foundation.dart';

import 'package:equatable/equatable.dart';

import 'package:seller/src/modules/auth/domain/usecases/signup/signup_usecase.dart';
import 'package:seller/src/modules/auth/domain/entities/signup/signup_entity.dart';

part 'signup_state.dart';

class SignUpLogic extends ValueNotifier<SignUpState> {
  late final SignUpUseCase _signUpUseCase;

  SignUpLogic(
    this._signUpUseCase,
  ) : super(SignUpInitialState());

  Future<void> signUp(SignUpParams params) async {
    value = SignUpLoadingState();

    try {
      final _response = await _signUpUseCase(params);

      value = SignUpSuccessState(_response);
    } catch (error) {
      value = SignUpFailureState(error.toString());
    }
  }
}
