import 'package:flutter/material.dart';
import 'package:slicedtv/utils/conts/colors.dart';

class LeftPageNavigation extends StatefulWidget {
  @override
  _LeftPageNavigationState createState() => _LeftPageNavigationState();
}

class _LeftPageNavigationState extends State<LeftPageNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      color: ColorPalette.blackDark,
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  width: 72,
                  height: 50,
                  color: ColorPalette.yellowMedium,
                  child: Icon(
                    Icons.home,
                    color: ColorPalette.blackDark,
                    size: 28,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  width: 72,
                  height: 50,
                  color: ColorPalette.blackDark,
                  child: Icon(
                    Icons.ondemand_video,
                    color: ColorPalette.greyLight,
                    size: 28,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  width: 72,
                  height: 50,
                  color: ColorPalette.blackDark,
                  child: Icon(
                    Icons.home,
                    color: ColorPalette.greyLight,
                    size: 28,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
