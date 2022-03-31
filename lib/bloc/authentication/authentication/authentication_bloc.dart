import 'package:bloc/bloc.dart';
import 'package:flutter_test_project/data/repository/authentication_repo.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepo authenticationRepo = AuthenticationRepo();
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AppStart>(_onAppStart);
    on<AuthenticationLogOuted>(_onAuthenticationLogOuted);
  }

  void _onAppStart(AppStart event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      final bool isSignIn = await authenticationRepo.isSignIn();
      final user = await authenticationRepo.getUser();
      if (isSignIn) {
        emit(AuthenticationSuccess(user: user));
      }
      else {
        emit(AuthenticationFailure());
      }
    } catch (e) {
    }
  }

  void _onAuthenticationLogOuted(AuthenticationLogOuted event, Emitter<AuthenticationState> emit) async {
    await authenticationRepo.signOut();
    emit(AuthenticationFailure());
  }
}
