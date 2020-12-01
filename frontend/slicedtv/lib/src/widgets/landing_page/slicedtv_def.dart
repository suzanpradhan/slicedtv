import 'package:flutter/material.dart';
import 'package:slicedtv/utils/conts/colors.dart';
import 'package:slicedtv/utils/screen_config.dart';

class SlicedTVDef extends StatefulWidget {
  @override
  _SlicedTVDefState createState() => _SlicedTVDefState();
}

class _SlicedTVDefState extends State<SlicedTVDef> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: ScreenConfig.screenWidth,
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "What is SlicedTV?",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "SF-PRO-DISPLAY-BOLD",
                fontWeight: FontWeight.w700,
                fontSize: 32),
          ),
          SizedBox(
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
                "Sliced TV is a entertainment service with an evolving streaming service offering the\nmost compelling selection of TV shows, movies, anime, documentaries and shared\nvirtual living room watch party to watch together, play together and be to together with\nfriends whatever they are.",
                style: TextStyle(
                  color: ColorPalette.greyLight,
                  fontFamily: "SF-PRO-TEXT",
                  fontSize: 16,
                ),
                textAlign: TextAlign.center),
          ),
          SizedBox(
            height: 28,
          ),
          RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            color: ColorPalette.purpleMedium,
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
    );
  }
}
