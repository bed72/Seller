part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

@immutable
class SplashVerifyAccessTokenEvent extends SplashEvent {}

@immutable
class SplashVerifyConnectivityEvent extends SplashEvent {}
