part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class UsernameNotValidState extends AuthState {
  final String message;
  const UsernameNotValidState({this.message});

  @override
  List<Object> get props => [message];
}

class UsernameValidState extends AuthState {
  const UsernameValidState();

  @override
  List<Object> get props => [];
}

class EmailNotValidState extends AuthState {
  final String message;
  const EmailNotValidState({this.message});

  @override
  List<Object> get props => [message];
}

class EmailValidState extends AuthState {
  const EmailValidState();

  @override
  List<Object> get props => [];
}

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {
  final AuthModel authModel;
  const SignUpSuccess({this.authModel});

  @override
  List<Object> get props => [authModel];
}

class SignUpError extends AuthState {
  final String errorMessage;
  const SignUpError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
