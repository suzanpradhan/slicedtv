import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slicedtv/blocs/auth/auth_bloc.dart';
import 'package:slicedtv/blocs/login_signup/loginsignup_bloc.dart';
import 'package:slicedtv/src/widgets/landing_page/login_form.dart';
import 'package:slicedtv/src/widgets/landing_page/signup_from.dart';
import 'package:slicedtv/utils/conts/colors.dart';
import 'package:slicedtv/utils/screen_config.dart';

class LoginSigUpWidget extends StatefulWidget {
  @override
  _LoginSigUpWidgetState createState() => _LoginSigUpWidgetState();
}

class _LoginSigUpWidgetState extends State<LoginSigUpWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Container(
      child: Column(
        children: [
          BlocBuilder<LoginsignupBloc, LoginsignupState>(
            builder: (context, state) {
              return Row(
                children: [
                  FlatButton(
                    minWidth: 10,
                    onPressed: () {
                      BlocProvider.of<LoginsignupBloc>(context)
                          .add(NavigateToLoginForm());
                    },
                    color: ColorPalette.blackDark,
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: (state is LoginFormState)
                              ? Colors.white
                              : ColorPalette.greyLight,
                          fontFamily: "SF-PRO-DISPLAY",
                          fontSize: 16),
                    ),
                  ),
                  FlatButton(
                    minWidth: 10,
                    onPressed: () {
                      BlocProvider.of<LoginsignupBloc>(context)
                          .add(NavigateToSignUpForm());
                    },
                    color: ColorPalette.blackDark,
                    child: Text("Sign Up",
                        style: TextStyle(
                            color: (state is SignUpFormState)
                                ? Colors.white
                                : ColorPalette.greyLight,
                            fontFamily: "SF-PRO-DISPLAY",
                            fontSize: 16)),
                  )
                ],
              );
            },
          ),
          SizedBox(
            height: 4,
          ),
          BlocConsumer<LoginsignupBloc, LoginsignupState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is LoginFormState) {
                return MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                          value: BlocProvider.of<LoginsignupBloc>(context)),
                      BlocProvider(create: (context) => AuthBloc())
                    ],
                    child: Container(
                      child: LoginForm(),
                    ));
              } else if (state is SignUpFormState) {
                return MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                          value: BlocProvider.of<LoginsignupBloc>(context)),
                      BlocProvider(create: (context) => AuthBloc())
                    ],
                    child: Container(
                      child: SignUpForm(),
                    ));
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
