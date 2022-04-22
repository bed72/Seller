import 'package:flutter/foundation.dart';

import 'package:equatable/equatable.dart';

import 'package:seller/src/modules/auth/domain/entities/me/me_entity.dart';
import 'package:seller/src/modules/auth/domain/usecases/me/me_usecase.dart';

part 'me_state.dart';

class MeLogic extends ValueNotifier<MeState> {
  late final MeUseCase _meUseCase;

  MeLogic(this._meUseCase) : super(MeInitialState());

  Future<void> getMe(MeParams params) async {
    value = MeLoadingState();

    try {
      final _response = await _meUseCase.getMe(params);

      value = MeSuccessState(_response);
    } catch (error) {
      value = MeFailureState(error.toString());
    }
  }
}
