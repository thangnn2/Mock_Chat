part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent extends Equatable {}

class PressSignUpButton extends SignUpEvent {
  final String? name;
  final String? email;
  final String? password;

  PressSignUpButton({this.email, this.password, this.name});

  @override
  List<Object?> get props => [email, password, name];

}
