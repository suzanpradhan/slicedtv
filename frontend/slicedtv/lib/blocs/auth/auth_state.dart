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

class PasswordNotValidState extends AuthState {
  final String message;
  const PasswordNotValidState({this.message});

  @override
  List<Object> get props => [message];
}

class PasswordValidOfAuthState extends AuthState {
  const PasswordValidOfAuthState();

  @override
  List<Object> get props => [];
}

class PasswordNotSameState extends AuthState {
  final String message;
  const PasswordNotSameState({this.message});

  @override
  List<Object> get props => [message];
}

class PasswordMatchedState extends AuthState {
  const PasswordMatchedState();

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

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final AuthModel authModel;
  const LoginSuccess({this.authModel});

  @override
  List<Object> get props => [authModel];
}

class LoginError extends AuthState {
  final String errorMessage;
  const LoginError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
