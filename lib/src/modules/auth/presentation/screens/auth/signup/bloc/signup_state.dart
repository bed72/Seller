part of 'signup_bloc.dart';

@immutable
abstract class SignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

@immutable
class SignUpInitialState extends SignUpState {}

@immutable
class SignUpLoadingState extends SignUpState {}

@immutable
class SignUpSuccessState extends SignUpState {
  late final SignUpEntity entity;

  SignUpSuccessState(this.entity);

  @override
  List<Object?> get props => [entity];
}

@immutable
class SignUpFailureState extends SignUpState {
  late final String message;

  SignUpFailureState(this.message);

  @override
  List<Object?> get props => [message];
}
