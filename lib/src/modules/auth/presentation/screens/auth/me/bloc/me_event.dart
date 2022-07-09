part of 'me_bloc.dart';

@immutable
abstract class MeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

@immutable
class MeGetAwnerEvent extends MeEvent {
  late final HttpParams params;

  MeGetAwnerEvent(this.params);

  @override
  List<Object?> get props => [params];
}
