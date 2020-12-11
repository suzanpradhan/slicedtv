import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:email_validator/email_validator.dart';
import 'package:slicedtv/apis/provider/auth_provider.dart';
import 'package:slicedtv/models/auth_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthProvider authProvider;
  AuthBloc({this.authProvider}) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is UsernameValidate) {
      if ((event.username.length < 4) || (event.username.length > 25)) {
        yield UsernameNotValidState(
            message: "*Usernames must be between 4 and 25 characters.");
      } else {
        yield UsernameValidState();
      }
    } else if (event is EmailValidate) {
      if (!EmailValidator.validate(event.email)) {
        yield EmailNotValidState(message: "*Please enter a valid email.");
      } else {
        yield EmailValidState();
      }
    } else if (event is PasswordValidate) {
      if ((event.password.length < 6) || (event.password.length > 25)) {
        yield PasswordNotValidState(
            message: "*Password must be between 6 and 25 characters.");
      } else {
        yield PasswordValidOfAuthState();
      }
    } else if (event is ConfirmPasswordValidate) {
      if (event.password != event.confirmPassword) {
        yield PasswordNotSameState(
            message: "*Confirmation password must be same.");
      } else {
        yield PasswordMatchedState();
      }
    } else if (event is SignUpCLickedEvent) {
      yield* mapSignUpEventToState(
          authModel: AuthModel(
              username: event.username,
              email: event.email,
              password: event.password,
              confirmPassword: event.confrimPassword));
    } else if (event is LoginClicekdEvent) {
      if (event.usernameEmail.length < 4) {
        yield LoginError(
            errorMessage: "*Usernames must be between 4 and 25 characters.");
      } else {
        if (!EmailValidator.validate(event.usernameEmail)) {
          yield* mapLoginEventToState(
              authModel: AuthModel(
                  username: event.usernameEmail, password: event.password));
        } else {
          yield* mapLoginEventToState(
              authModel: AuthModel(
                  email: event.usernameEmail, password: event.password));
        }
      }
    }
  }

  Stream<AuthState> mapSignUpEventToState({AuthModel authModel}) async* {
    if ((authModel.username.length < 4) || (authModel.username.length > 25)) {
      yield UsernameNotValidState(
          message: "*Usernames must be between 4 and 25 characters.");
    } else if (!EmailValidator.validate(authModel.email)) {
      yield EmailNotValidState(message: "*Please enter a valid email.");
    } else if ((authModel.password.length < 6) ||
        (authModel.password.length > 25)) {
      yield PasswordNotValidState(
          message: "*Password must be between 6 and 25 characters.");
    } else if (authModel.password != authModel.confirmPassword) {
      yield PasswordNotSameState(
          message: "*Confirmation password must be same.");
    } else {
      yield SignUpLoading();
      try {
        AuthModel _authModel =
            await authProvider.register(authModel: authModel);
        yield SignUpSuccess(authModel: _authModel);
      } catch (e) {
        yield SignUpError(errorMessage: e.toString());
      }
    }
  }

  Stream<AuthState> mapLoginEventToState({AuthModel authModel}) async* {
    if ((authModel.password.length < 6) || (authModel.password.length > 25)) {
      yield PasswordNotValidState(
          message: "*Password must be between 6 and 25 characters.");
    } else {
      yield LoginLoading();
      try {
        AuthModel _authModel = await authProvider.login(authModel: authModel);
        yield LoginSuccess(authModel: _authModel);
      } catch (e) {
        yield LoginError(errorMessage: e.toString());
      }
    }
  }
}
