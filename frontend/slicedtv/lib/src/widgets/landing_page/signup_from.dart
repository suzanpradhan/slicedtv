import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slicedtv/blocs/auth/auth_bloc.dart';
import 'package:slicedtv/blocs/login_signup/loginsignup_bloc.dart';
import 'package:slicedtv/src/widgets/custom_widgets/custom_textfield.dart';
import 'package:slicedtv/utils/conts/colors.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
              if (state is SignUpError) {
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
            "Username",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "SF-PRO-DISPLAY",
                fontSize: 16),
          ),
          SizedBox(height: 14),
          CustomTextField(
            textEditingController: usernameController,
            isObsecure: false,
            obsecureIcon: false,
            onChanged: (value) {
              BlocProvider.of<AuthBloc>(context)
                  .add(UsernameValidate(username: value));
            },
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is UsernameNotValidState) {
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
              } else if (state is UsernameValidState) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
          SizedBox(height: 14),
          Text(
            "Email",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "SF-PRO-DISPLAY",
                fontSize: 16),
          ),
          SizedBox(height: 14),
          CustomTextField(
            textEditingController: emailController,
            isObsecure: false,
            obsecureIcon: false,
            onChanged: (value) {
              BlocProvider.of<AuthBloc>(context)
                  .add(EmailValidate(email: value));
            },
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is EmailNotValidState) {
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
              } else if (state is EmailValidState) {
                return Container();
              } else {
                return Container();
              }
            },
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
          SizedBox(height: 14),
          Text(
            "Confirm Password",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "SF-PRO-DISPLAY",
                fontSize: 16),
          ),
          SizedBox(height: 14),
          CustomTextField(
            textEditingController: confirmPasswordController,
            isObsecure: true,
            obsecureIcon: true,
            onChanged: (value) {
              BlocProvider.of<AuthBloc>(context).add(ConfirmPasswordValidate(
                  password: passwordController.text, confirmPassword: value));
            },
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is PasswordNotSameState) {
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
              } else if (state is PasswordMatchedState) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              BlocProvider.of<AuthBloc>(context)
                ..add(SignUpCLickedEvent(
                    username: usernameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    confrimPassword: confirmPasswordController.text));
            },
            child: Container(
              width: 320,
              height: 32,
              decoration: BoxDecoration(
                  color: ColorPalette.purpleMedium,
                  borderRadius: BorderRadius.circular(4)),
              child: Center(
                child: Text(
                  "Sign Up",
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
