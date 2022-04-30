import 'package:bloc/bloc.dart';

import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc_concurrency/bloc_concurrency.dart';

import 'package:seller/src/modules/auth/domain/entities/signup/signup_entity.dart';
import 'package:seller/src/modules/auth/domain/usecases/signup/signup_usecase.dart';

import 'package:seller/src/modules/firabase/domain/usecases/crashlytics_usecase.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignUpEvent, SignUpState> {
  late final SignUpUseCase _signUpUseCase;
  late final CrashlyticsUseCase _crashlyticsUseCase;

  SignupBloc(
    this._signUpUseCase,
    this._crashlyticsUseCase,
  ) : super(SignUpInitialState()) {
    on<SignUpAwnerEvent>(_signUp, transformer: restartable());
  }

  Future<void> _signUp(
    SignUpAwnerEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoadingState());

    final _response = await _signUpUseCase(event.params).onError(
      (exception, stack) => _crashlyticsUseCase.recordError(
        exception: exception ?? '',
        stack: stack,
      ),
    );

    _response.fold(
      (left) => emit(SignUpFailureState(left.message)),
      (right) => emit(SignUpSuccessState(right)),
    );
  }
}
