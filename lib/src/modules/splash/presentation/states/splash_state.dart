part of 'splash_logic.dart';

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
class SplashSuccessState extends SplashState {}

@immutable
class SplashFailureState extends SplashState {
  late final String message;

  SplashFailureState(this.message);

  @override
  List<Object?> get props => [message];
}
