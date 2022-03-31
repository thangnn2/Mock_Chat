part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {}

class AppStart extends AuthenticationEvent {

  @override
  List<Object?> get props => [];
}


class AuthenticationLogOuted extends AuthenticationEvent {

  @override
  List<Object?> get props => [];
}

class PressButtonLogOut extends AuthenticationEvent {

  @override
  List<Object?> get props => [];
}
