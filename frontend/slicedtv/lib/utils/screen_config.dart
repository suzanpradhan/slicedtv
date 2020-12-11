import 'package:flutter/widgets.dart';

class ScreenConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double tabletWidthSize;
  static double mobileWidthSize;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    tabletWidthSize = 800.0;
    mobileWidthSize = 500.0;
  }

  bool isTablet() {
    if ((screenWidth < 800) && (screenWidth > 600)) {
      return true;
    } else {
      return false;
    }
  }

  bool isMobile() {
    if (screenWidth < 600) {
      return true;
    } else {
      return false;
    }
  }
}
