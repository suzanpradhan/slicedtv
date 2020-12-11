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
          SizedBox(height: 20),
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
            onChanged: (value) {},
          ),
          SizedBox(height: 10),
          Text("Forget Password?",
              style: TextStyle(
                  color: ColorPalette.greyLight,
                  fontFamily: "SF-PRO-TEXT",
                  fontSize: 12)),
          SizedBox(height: 20),
          InkWell(
            onTap: () {},
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
