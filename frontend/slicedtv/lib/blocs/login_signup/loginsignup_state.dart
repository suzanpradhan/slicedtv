part of 'loginsignup_bloc.dart';

abstract class LoginsignupState extends Equatable {
  const LoginsignupState();

  @override
  List<Object> get props => [];
}

class LoginsignupInitial extends LoginsignupState {}

class PasswordValidState extends LoginsignupState {}

class LoginFormState extends LoginsignupState {}

class SignUpFormState extends LoginsignupState {}
