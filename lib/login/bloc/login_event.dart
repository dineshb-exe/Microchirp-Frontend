part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginInitialEvent extends LoginEvent{

}

class LoginButtonPressedEvent extends LoginEvent{
  final PreLogin credentials;

  LoginButtonPressedEvent({required this.credentials});
}