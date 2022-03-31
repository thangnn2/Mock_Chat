part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState extends Equatable {}

class SignInInitial extends SignInState {

  @override
  List<Object?> get props => [];
}

class SignInLoading extends SignInState {

  @override
  List<Object?> get props => [];
}

class SignInSuccess extends SignInState {


  @override
  List<Object?> get props => [];
}

class SignInFailure extends SignInState {

  @override
  List<Object?> get props => [];
}