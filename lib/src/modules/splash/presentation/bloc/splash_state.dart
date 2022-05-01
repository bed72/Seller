part of 'splash_bloc.dart';

@immutable
abstract class SplashState extends Equatable {
  @override
  List<Object?> get props => [];
}

@immutable
class SplashInitialState extends SplashState {}

@immutable
class SplashLoadingState extends SplashState {}

@immutable
class SplashThereIsConnectionState extends SplashState {}

@immutable
class SplashThereIsNoConnectionState extends SplashState {
  late final String message;

  SplashThereIsNoConnectionState(this.message);

  @override
  List<Object?> get props => [message];
}

@immutable
class SplashThereIsAccessTokenState extends SplashState {}

@immutable
class SplashThereIsNoAccessTokenState extends SplashState {}
