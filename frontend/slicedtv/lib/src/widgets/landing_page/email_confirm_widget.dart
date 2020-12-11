import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slicedtv/blocs/login_signup/loginsignup_bloc.dart';
import 'package:slicedtv/utils/conts/colors.dart';

class EmailConfirmWidget extends StatefulWidget {
  final String username;
  final String email;
  EmailConfirmWidget({this.email, this.username});
  @override
  _EmailConfirmWidgetState createState() => _EmailConfirmWidgetState();
}

class _EmailConfirmWidgetState extends State<EmailConfirmWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 80,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 320,
            child: RichText(
              text: TextSpan(
                  style: TextStyle(
                      fontFamily: "SF-PRO-TEXT",
                      fontSize: 18,
                      color: ColorPalette.greyLight),
                  children: [
                    TextSpan(text: "Hi, "),
                    TextSpan(
                        text: widget.username + "! ",
                        style: TextStyle(color: Colors.white)),
                    TextSpan(text: "An email has been sent to "),
                    TextSpan(
                        text: widget.email + ".",
                        style: TextStyle(color: Colors.white))
                  ]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              BlocProvider.of<LoginsignupBloc>(context)
                ..add(NavigateToLoginForm());
            },
            child: Container(
              width: 320,
              height: 32,
              decoration: BoxDecoration(
                  color: ColorPalette.purpleMedium,
                  borderRadius: BorderRadius.circular(4)),
              child: Center(
                child: Text(
                  "Log In Now",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "SF-PRO-DISPLAY",
                      fontSize: 16),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
