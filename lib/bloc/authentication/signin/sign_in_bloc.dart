import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_test_project/data/repository/authentication_repo.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthenticationRepo? authenticationRepo = AuthenticationRepo();
  SignInBloc() : super(SignInInitial()) {
    on<PressSignInButton>(_onPressSignInButton);
  }

  void _onPressSignInButton(PressSignInButton event, Emitter<SignInState> emit) async {
    emit(SignInLoading());
    try {
      final userCredential = await authenticationRepo?.signIn(email: event.email, password: event.password);
      if (userCredential != null) {
        emit(SignInSuccess());
      }
    } catch (e) {
      emit(SignInFailure());
    }
  }
}
