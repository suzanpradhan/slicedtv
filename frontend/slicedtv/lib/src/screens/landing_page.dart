import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slicedtv/blocs/login_signup/loginsignup_bloc.dart';
import 'package:slicedtv/src/widgets/landing_page/get_started_widget.dart';
import 'package:slicedtv/src/widgets/landing_page/login_signup_widget.dart';
import 'package:slicedtv/src/widgets/landing_page/slicedtv_def.dart';
import 'package:slicedtv/utils/conts/colors.dart';
import 'package:slicedtv/utils/screen_config.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginsignupBloc(),
      child: LandingPageStateful(),
    );
  }
}

class LandingPageStateful extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPageStateful> {
  showLoginSignUpDialog(LoginsignupEvent addEvent) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
            scrollable: true,
            backgroundColor: ColorPalette.blackDark,
            content: BlocProvider.value(
              value: BlocProvider.of<LoginsignupBloc>(context)..add(addEvent),
              child: LoginSigUpWidget(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("sliced.tv"),
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text(
              "About",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "SF-PRO-DISPLAY",
                  fontSize: 16),
            ),
          ),
          SizedBox(width: 14),
          FlatButton(
            onPressed: () {},
            child: Text(
              "Help",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "SF-PRO-DISPLAY",
                  fontSize: 16),
            ),
          ),
          SizedBox(width: 14),
          FlatButton(
            onPressed: () {},
            child: Text(
              "Premium",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "SF-PRO-DISPLAY",
                  fontSize: 16),
            ),
          ),
          SizedBox(width: 14),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              color: ColorPalette.greyMedium,
              onPressed: () {
                showLoginSignUpDialog(NavigateToLoginForm());
              },
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "SF-PRO-DISPLAY"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              color: ColorPalette.purpleMedium,
              onPressed: () {
                showLoginSignUpDialog(NavigateToSignUpForm());
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "SF-PRO-DISPLAY"),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: ScreenConfig.screenWidth,
              height: ScreenConfig.screenHeight,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "images/background_image_landingpage.png",
                      ))),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  BlocProvider.value(
                      value: BlocProvider.of<LoginsignupBloc>(context),
                      child: GetStartedWidget(
                        showLoginSignUp: showLoginSignUpDialog,
                      )),
                  BlocProvider.value(
                      value: BlocProvider.of<LoginsignupBloc>(context),
                      child: SlicedTVDef(
                        onGetStartedClicked: showLoginSignUpDialog,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
