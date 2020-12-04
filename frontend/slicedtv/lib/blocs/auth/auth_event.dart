part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class UsernameValidate extends AuthEvent {
  final String username;
  const UsernameValidate({this.username});

  @override
  List<Object> get props => [username];
}

class EmailValidate extends AuthEvent {
  final String email;
  const EmailValidate({this.email});

  @override
  List<Object> get props => [email];
}

class PasswordValidate extends AuthEvent {}

class LoginClicekdEvent extends AuthEvent {
  final String usernameEmail;
  final String password;
  const LoginClicekdEvent({this.usernameEmail, this.password});

  @override
  List<Object> get props => [usernameEmail, password];
}

class SignUpCLickedEvent extends AuthEvent {
  final String username;
  final String password;
  final String email;
  final String confrimPassword;
  const SignUpCLickedEvent(
      {this.username, this.password, this.email, this.confrimPassword});

  @override
  List<Object> get props => [username, password, email, confrimPassword];
}
