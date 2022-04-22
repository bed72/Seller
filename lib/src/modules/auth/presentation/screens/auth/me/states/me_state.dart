part of 'me_logic.dart';

@immutable
abstract class MeState extends Equatable {
  @override
  List<Object?> get props => [];
}

@immutable
class MeInitialState extends MeState {}

@immutable
class MeLoadingState extends MeState {}

@immutable
class MeSuccessState extends MeState {
  late final MeEntity entity;

  MeSuccessState(this.entity);

  @override
  List<Object?> get props => [entity];
}

@immutable
class MeFailureState extends MeState {
  late final String message;

  MeFailureState(this.message);

  @override
  List<Object?> get props => [message];
}
