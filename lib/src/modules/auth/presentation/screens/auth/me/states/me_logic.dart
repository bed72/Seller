import 'package:flutter/foundation.dart';

import 'package:equatable/equatable.dart';

import 'package:seller/src/modules/auth/domain/entities/me/me_entity.dart';
import 'package:seller/src/modules/auth/domain/usecases/me/me_usecase.dart';

import 'package:seller/src/modules/firabase/domain/usecases/crashlytics_usecase.dart';

part 'me_state.dart';

class MeLogic extends ValueNotifier<MeState> {
  late final MeUseCase _meUseCase;
  late final CrashlyticsUseCase _crashlyticsUseCase;

  MeLogic(
    this._meUseCase,
    this._crashlyticsUseCase,
  ) : super(MeInitialState());

  Future<void> getMe(MeParams params) async {
    value = MeLoadingState();

    try {
      final _response = await _meUseCase.getMe(params);

      value = MeSuccessState(_response);
    } catch (error) {
      _crashlyticsUseCase.log(message: 'Error in load data user. Path: /me');
      value = MeFailureState(error.toString());
    }
  }
}
