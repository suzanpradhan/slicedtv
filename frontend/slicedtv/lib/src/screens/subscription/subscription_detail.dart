import 'dart:html';

import 'package:flutter/material.dart';
import 'package:slicedtv/utils/conts/colors.dart';
import 'package:slicedtv/utils/screen_config.dart';

class SubscriptionDetail extends StatefulWidget {
  @override
  _SubscriptionDetailState createState() => _SubscriptionDetailState();
}

class _SubscriptionDetailState extends State<SubscriptionDetail> {
  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        title: Text("sliced.tv"),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              color: Colors.redAccent,
              onPressed: () {},
              child: Text(
                "Sign Out",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "SF-PRO-DISPLAY-BOLD",
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      body: Container(
        height: ScreenConfig.screenHeight,
        width: ScreenConfig.screenWidth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Choose Your Plan.",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "SF-PRO-DISPLAY",
                    fontSize: 32),
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 320,
                    height: 400,
                    decoration: BoxDecoration(
                        color: ColorPalette.blackDark,
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  Container(
                      width: 320,
                      height: 400,
                      decoration: BoxDecoration(
                          color: ColorPalette.blackLightDark,
                          borderRadius: BorderRadius.circular(16)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
