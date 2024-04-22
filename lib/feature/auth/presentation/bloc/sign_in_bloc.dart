import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_test_ui/feature/auth/domain/repository/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required AuthRepo authRepo})
      : _authRepo = authRepo,
        super(SignInInitial()) {
    on<SignInButtonPressedEvent>(_onSignInButtonPressedEvent);
  }

  final AuthRepo _authRepo;

  FutureOr<void> _onSignInButtonPressedEvent(event, emit) async {
    emit(SignInLoading());

    final result = await _authRepo.signIn(
      username: event.username,
      password: event.password,
    );
    result.fold(
      (l) => emit(SignInError(error: l.toString())),
      (r) => {
        if (r == true) {emit(SignInSuccess())}
      },
    );
  }
}
