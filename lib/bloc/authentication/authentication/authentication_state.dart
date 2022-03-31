part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {}

class AuthenticationInitial extends AuthenticationState {

  @override
  List<Object?> get props => [];
}

class AuthenticationLoading extends AuthenticationState {

  @override
  List<Object?> get props => [];
}


class AuthenticationSuccess extends AuthenticationState {
  final User? user;
  AuthenticationSuccess({this.user});
  @override
  List<Object?> get props => [user];
}

class AuthenticationFailure extends AuthenticationState {

  @override
  List<Object?> get props => [];
}
