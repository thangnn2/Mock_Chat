import 'package:bloc/bloc.dart';
import 'package:flutter_test_project/data/repository/authentication_repo.dart';
import 'package:flutter_test_project/data/repository/user_repo.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthenticationRepo? authenticationRepo = AuthenticationRepo();
  final UserRepo? userRepo = UserRepo();
  SignUpBloc() : super(SignUpInitial()) {
    on<PressSignUpButton>(_onPressSignUpButton);
  }

  void _onPressSignUpButton(PressSignUpButton event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    try {
      final userCredential = await authenticationRepo?.signUp(email: event.email, password: event.password);
      if (userCredential != null) {
        await userRepo?.updateUserData(name: event.name, email: userCredential.user?.email, userId: userCredential.user?.uid);
        emit(SignUpSuccess());
      }
    } catch (e) {
      emit(SignUpFailure());
    }
  }
}
