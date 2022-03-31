part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent extends Equatable {}

class PressSignInButton extends SignInEvent {
  final String? email;
  final String? password;

  PressSignInButton({this.email, this.password});

  @override
  List<Object?> get props => [email, password];
}
