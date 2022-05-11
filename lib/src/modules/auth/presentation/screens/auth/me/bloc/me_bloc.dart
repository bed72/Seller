import 'package:bloc/bloc.dart';

import 'package:flutter/foundation.dart';

import 'package:equatable/equatable.dart';

import 'package:bloc_concurrency/bloc_concurrency.dart';

import 'package:seller/src/modules/auth/domain/entities/me/me_entity.dart';
import 'package:seller/src/modules/auth/domain/usecases/me/me_usecase.dart';

import 'package:seller/src/modules/firabase/domain/usecases/crashlytics_usecase.dart';

part 'me_event.dart';
part 'me_state.dart';

class MeBloc extends Bloc<MeEvent, MeState> {
  late final MeUseCase _meUseCase;
  late final CrashlyticsUseCase _crashlyticsUseCase;

  MeBloc(
    this._meUseCase,
    this._crashlyticsUseCase,
  ) : super(MeInitialState()) {
    on<MeGetAwnerEvent>(_getMe, transformer: concurrent());
  }

  Future<void> _getMe(
    MeGetAwnerEvent event,
    Emitter<MeState> emit,
  ) async {
    emit(MeLoadingState());

    final response = await _meUseCase(event.params).onError(
      (exception, stack) => _crashlyticsUseCase.recordError(
        exception: exception ?? '',
        stack: stack,
      ),
    );

    response.fold(
      (left) => emit(MeFailureState(left.message)),
      (right) => emit(MeSuccessState(right)),
    );
  }
}
