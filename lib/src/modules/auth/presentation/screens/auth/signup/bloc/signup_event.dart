part of 'signup_bloc.dart';

@immutable
abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

@immutable
class SignUpAwnerEvent extends SignUpEvent {
  late final SignUpParams params;

  SignUpAwnerEvent(this.params);

  @override
  List<Object?> get props => [params];
}
