part of 'loginsignup_bloc.dart';

abstract class LoginsignupEvent extends Equatable {
  const LoginsignupEvent();

  @override
  List<Object> get props => [];
}

class NavigateToLoginForm extends LoginsignupEvent {}

class NavigateToSignUpForm extends LoginsignupEvent {}

class NavigateToEmailVerification extends LoginsignupEvent {
  final AuthModel authModel;
  NavigateToEmailVerification({this.authModel});

  @override
  List<Object> get props => [authModel];
}
