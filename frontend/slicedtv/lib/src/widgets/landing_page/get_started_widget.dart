import 'package:flutter/material.dart';
import 'package:slicedtv/blocs/login_signup/loginsignup_bloc.dart';
import 'package:slicedtv/utils/conts/colors.dart';
import 'package:slicedtv/utils/screen_config.dart';

class GetStartedWidget extends StatefulWidget {
  final Function showLoginSignUp;
  GetStartedWidget({this.showLoginSignUp});
  @override
  _GetStartedWidgetState createState() => _GetStartedWidgetState();
}

class _GetStartedWidgetState extends State<GetStartedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenConfig.screenWidth,
        height: ScreenConfig.screenHeight,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withOpacity(0), Colors.black])),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 72,
              ),
              Text(
                "Watch Unlimited Movies, \nTV Shows and more with your Friends.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                    fontFamily: "SF-PRO-DISPLAY-BOLD"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Host a watch party and watch whatever you want, \nwhatever you are with your friends.",
                style: TextStyle(
                    color: ColorPalette.greyLight,
                    fontSize: 16,
                    letterSpacing: 1,
                    fontFamily: "SF-PRO-TEXT"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Explore millions of media content.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 1,
                    fontFamily: "SF-PRO-TEXT"),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                color: ColorPalette.purpleMedium,
                onPressed: () {
                  widget.showLoginSignUp(NavigateToSignUpForm());
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    "Get Started!",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "SF-PRO-DISPLAY",
                        fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
