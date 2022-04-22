part of 'user_logic.dart';

@immutable
abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

@immutable
class UserInitialState extends UserState {}

@immutable
class UserLoadingState extends UserState {}

@immutable
class UserSuccessState extends UserState {
  late final UserEntity entity;

  UserSuccessState(this.entity);

  @override
  List<Object?> get props => [entity];
}

@immutable
class UserFailureState extends UserState {
  late final String message;

  UserFailureState(this.message);

  @override
  List<Object?> get props => [message];
}
