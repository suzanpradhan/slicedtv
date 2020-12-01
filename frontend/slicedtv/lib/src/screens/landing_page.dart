import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:slicedtv/src/widgets/landing_page/get_started_widget.dart';
import 'package:slicedtv/src/widgets/landing_page/login_signup_widget.dart';
import 'package:slicedtv/src/widgets/landing_page/slicedtv_def.dart';
import 'package:slicedtv/utils/conts/colors.dart';
import 'package:slicedtv/utils/screen_config.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  showLoginSignUpDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ColorPalette.blackLightDark,
          content: LoginSigUpWidget(),
        );
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
              onPressed: () {},
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
              onPressed: () {},
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
                  GetStartedWidget(
                    showLoginSignUp: showLoginSignUpDialog,
                  ),
                  SlicedTVDef()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
