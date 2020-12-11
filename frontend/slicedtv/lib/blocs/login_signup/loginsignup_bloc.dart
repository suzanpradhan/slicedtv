import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:slicedtv/models/auth_model.dart';

part 'loginsignup_event.dart';
part 'loginsignup_state.dart';

class LoginsignupBloc extends Bloc<LoginsignupEvent, LoginsignupState> {
  LoginsignupBloc() : super(LoginsignupInitial());

  @override
  Stream<LoginsignupState> mapEventToState(
    LoginsignupEvent event,
  ) async* {
    if (event is NavigateToLoginForm) {
      yield LoginFormState();
    }
    if (event is NavigateToSignUpForm) {
      yield SignUpFormState();
    }
    if (event is NavigateToEmailVerification) {
      yield EmailVerificaitonState(authModel: event.authModel);
    }
  }
}
