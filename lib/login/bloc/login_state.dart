part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginInitialState extends LoginState {}

class LoginErrorState extends LoginState {}

abstract class LoginActionState extends LoginState {}

class LoginNavigateToHomeActionState extends LoginActionState {
  LoginNavigateToHomeActionState({required this.authValues});
  PostLogin authValues;
}

class LoginUsernameFailedActionState extends LoginActionState {}

class LoginPasswordFailedActionState extends LoginActionState {}