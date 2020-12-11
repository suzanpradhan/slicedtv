import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slicedtv/blocs/auth/auth_bloc.dart';
import 'package:slicedtv/src/widgets/custom_widgets/custom_textfield.dart';
import 'package:slicedtv/utils/conts/colors.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController usernameEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is LoginError) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Container(
                    width: 320,
                    child: Text(
                      state.errorMessage,
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontFamily: "SF-PRO-TEXT",
                          fontSize: 12),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
          SizedBox(height: 10),
          Text(
            "Username or Email",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "SF-PRO-DISPLAY",
                fontSize: 16),
          ),
          SizedBox(height: 14),
          CustomTextField(
            textEditingController: usernameEmailController,
            isObsecure: false,
            obsecureIcon: false,
            onChanged: (value) {},
          ),
          SizedBox(height: 14),
          Text(
            "Password",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "SF-PRO-DISPLAY",
                fontSize: 16),
          ),
          SizedBox(height: 14),
          CustomTextField(
            textEditingController: passwordController,
            isObsecure: true,
            obsecureIcon: true,
            onChanged: (value) {
              BlocProvider.of<AuthBloc>(context)
                  .add(PasswordValidate(password: value));
            },
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is PasswordNotValidState) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Container(
                    width: 320,
                    child: Text(
                      state.message,
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontFamily: "SF-PRO-TEXT",
                          fontSize: 12),
                    ),
                  ),
                );
              } else if (state is PasswordValidOfAuthState) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
          SizedBox(height: 10),
          Text("Forget Password?",
              style: TextStyle(
                  color: ColorPalette.greyLight,
                  fontFamily: "SF-PRO-TEXT",
                  fontSize: 12)),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              BlocProvider.of<AuthBloc>(context)
                ..add(LoginClicekdEvent(
                    usernameEmail: usernameEmailController.text,
                    password: passwordController.text));
            },
            child: Container(
              width: 320,
              height: 32,
              decoration: BoxDecoration(
                  color: ColorPalette.purpleMedium,
                  borderRadius: BorderRadius.circular(4)),
              child: Center(
                child: Text(
                  "Log In",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SF-PRO-DISPLAY",
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
