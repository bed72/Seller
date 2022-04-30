import 'package:flutter/widgets.dart';

import 'package:equatable/equatable.dart';

import 'package:seller/src/modules/storage/domain/usecases/storage_usecase.dart';

import 'package:seller/src/modules/connectivity/domain/usecases/connectivity_usecase.dart';

part 'splash_state.dart';

class SplashLogic extends ValueNotifier<SplashState> {
  late final StorageUsecase _storageUseCase;
  late final ConnectivityUseCase _connectivityUseCase;

  SplashLogic(
    this._storageUseCase,
    this._connectivityUseCase,
  ) : super(SplashInitialState());

  Future<void> verifyConnectivity(String path, BuildContext context) async {
    value = SplashLoadingState();

    final _response = await _connectivityUseCase();

    if (_response) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        path,
        (Route<dynamic> route) => false,
      );

      value = SplashSuccessState();
    } else {
      value = SplashFailureState('No connection');
    }
  }
}
