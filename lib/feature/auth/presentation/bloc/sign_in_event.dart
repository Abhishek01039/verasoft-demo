part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

class SignInButtonPressedEvent extends SignInEvent {
  SignInButtonPressedEvent({required this.username, required this.password});

  final String username;
  final String password;
}
