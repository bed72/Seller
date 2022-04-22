import 'package:flutter/foundation.dart';

import 'package:equatable/equatable.dart';
import 'package:seller/src/domain/entities/signup/signup_entity.dart';
import 'package:seller/src/domain/usecases/signup/signup_usecase.dart';

import 'package:seller/src/domain/usecases/storage/storage_usecase.dart';
import 'package:seller/src/presentation/utils/constants/app_constant.dart';

part 'signup_state.dart';

class SignUpLogic extends ValueNotifier<SignUpState> {
  late final SignUpUseCase _signUpUseCase;
  late final StorageUsecase _storageUseCase;

  SignUpLogic(
    this._signUpUseCase,
    this._storageUseCase,
  ) : super(SignUpInitialState());

  Future<void> signUp(SignUpParams params) async {
    value = SignUpLoadingState();

    try {
      final _response = await _signUpUseCase(params);

      await _verifyResponse(_response);

      value = SignUpSuccessState(_response);
    } catch (error) {
      value = SignUpFailureState(error.toString());
    }
  }

  Future<void> _verifyResponse(SignUpEntity data) async {
    const int _expiresIn = 3400;

    if (data.accessToken.isNotEmpty && data.refreshToken.isNotEmpty) {
      data = data.copyWith(
        accessToken: data.accessToken,
        refreshToken: data.refreshToken,
        expiresIn:
            data.expiresIn.toString().isEmpty ? _expiresIn : data.expiresIn,
      );

      await _saveData(data);
    }
  }

  Future<void> _saveData(SignUpEntity data) async {
    await _storageUseCase.save(
      key: AppContants.keyAuth,
      value: data.toString(),
    );
  }
}
