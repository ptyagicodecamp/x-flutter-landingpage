import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  const ResponsiveWidget(
      {Key key, this.largeScreen, this.mediumScreen, this.smallScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return smallScreen;
    //final shortestSide = MediaQuery.of(context).size.shortestSide;
    final shortestSide = getShortestSide(context);
    //Returns the largest screen for screens 1200 or larger.
    if (shortestSide >= 1200) {
      return largeScreen;
    } else if (shortestSide > 800 && shortestSide < 1200) {
      //if medium screen not available, then return large screen
      return mediumScreen ?? largeScreen;
    } else {
      //if small screen implementation not available, then return large screen
      return smallScreen ?? largeScreen;
    }
  }

  static double getShortestSide(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
  //Making these methods static, so that they can be used as accessed from other widgets

  //Large screen is any screen whose width is more than 1200 pixels
  static bool isLargeScreen(BuildContext context) {
    return getShortestSide(context) > 1200;
  }

  //Small screen is any screen whose width is less than 800 pixels
  static bool isSmallScreen(BuildContext context) {
    return getShortestSide(context) < 800;
  }

  //Medium screen is any screen whose width is less than 1200 pixels,
  //and more than 800 pixels
  static bool isMediumScreen(BuildContext context) {
    return getShortestSide(context) > 800 && getShortestSide(context) < 1200;
  }
}
