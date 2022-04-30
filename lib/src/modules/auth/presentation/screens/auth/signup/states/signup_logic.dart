import 'package:flutter/widgets.dart';

import 'package:equatable/equatable.dart';

import 'package:seller/src/modules/auth/domain/entities/signup/signup_entity.dart';
import 'package:seller/src/modules/auth/domain/usecases/signup/signup_usecase.dart';

import 'package:seller/src/modules/firabase/domain/usecases/crashlytics_usecase.dart';

part 'signup_state.dart';

class SignUpLogic extends ValueNotifier<SignUpState> {
  late final SignUpUseCase _signUpUseCase;
  late final CrashlyticsUseCase _crashlyticsUseCase;

  SignUpLogic(
    this._signUpUseCase,
    this._crashlyticsUseCase,
  ) : super(SignUpInitialState());

  Future<void> signUp(
    String path,
    SignUpParams params,
    BuildContext context,
  ) async {
    value = SignUpLoadingState();

    final _response = await _signUpUseCase(params).onError(
      (exception, stack) => _crashlyticsUseCase.recordError(
        exception: exception ?? '',
        stack: stack,
      ),
    );

    value = _response.fold(
      (left) => SignUpFailureState(left.message),
      (right) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          path,
          (Route<dynamic> route) => false,
        );

        return SignUpSuccessState(right);
      },
    );
  }
}
