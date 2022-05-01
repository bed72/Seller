import 'package:bloc/bloc.dart';

import 'package:flutter/foundation.dart';

import 'package:equatable/equatable.dart';

import 'package:bloc_concurrency/bloc_concurrency.dart';

import 'package:seller/src/utils/constants/app_constant.dart';

import 'package:seller/src/modules/storage/domain/usecases/storage_usecase.dart';

import 'package:seller/src/modules/connectivity/domain/usecases/connectivity_usecase.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  late final StorageUseCase _storageUseCase;
  late final ConnectivityUseCase _connectivityUseCase;

  SplashBloc(
    this._storageUseCase,
    this._connectivityUseCase,
  ) : super(SplashInitialState()) {
    on<SplashVerifyConnectivityEvent>(
      _verifyConnectivity,
      transformer: restartable(),
    );
    on<SplashVerifyAccessTokenEvent>(
      _verifyAccessToken,
      transformer: restartable(),
    );
  }

  Future<void> _verifyConnectivity(
    SplashVerifyConnectivityEvent event,
    Emitter<SplashState> emit,
  ) async {
    emit(SplashLoadingState());

    final _response = await _connectivityUseCase();

    _response
        ? emit(SplashThereIsConnectionState())
        : emit(SplashThereIsNoConnectionState('No connection'));
  }

  Future<void> _verifyAccessToken(
    SplashVerifyAccessTokenEvent event,
    Emitter<SplashState> emit,
  ) async {
    final _accessToken = _getAccessToken();

    _accessToken.isNotEmpty
        ? emit(SplashThereIsAccessTokenState())
        : emit(SplashThereIsNoAccessTokenState());
  }

  String _getAccessToken() {
    final _data = _storageUseCase.get(key: AppContants.keyAccessToken);

    return _data.isRight ? _data.right : '';
  }
}
