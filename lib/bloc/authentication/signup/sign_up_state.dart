part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState extends Equatable {}

class SignUpInitial extends SignUpState {

  @override
  List<Object?> get props => [];
}

class SignUpLoading extends SignUpState {

  @override
  List<Object?> get props => [];
}

class SignUpSuccess extends SignUpState {

  @override
  List<Object?> get props => [];
}

class SignUpFailure extends SignUpState {

  @override
  List<Object?> get props => [];
}