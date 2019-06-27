import 'package:flutter_web/material.dart';
import 'package:landingpage/utils/myColors.dart';

class MyAppThemes {

  static ThemeData AppThemeBlue(BuildContext context) {
    return ThemeData(
      // Define the default brightness and colors for the overall app.
      brightness: Brightness.light,
      primaryColor: MyColors.blue1,
      secondaryHeaderColor: MyColors.blue2,
      accentColor: MyColors.blue3,

      textTheme: getDefaultTextTheme(context),
    );
  }

  static ThemeData AppThemeGreen(BuildContext context) {
    return ThemeData(
      // Define the default brightness and colors for the overall app.
      brightness: Brightness.light,
      primaryColor: MyColors.green1,
      secondaryHeaderColor: MyColors.green2,
      accentColor: MyColors.green3,

      textTheme: getItalicTitleTextTheme(context),
    );
  }

  static ThemeData AppThemePurple(BuildContext context) {
    return ThemeData(
      // Define the default brightness and colors for the overall app.
      brightness: Brightness.light,
      primaryColor: MyColors.purple1,
      secondaryHeaderColor: MyColors.purple2,
      accentColor: MyColors.purple3,

      textTheme: getDefaultTextTheme(context),
    );
  }

  // Define the default TextTheme for headline, title and body text
  static TextTheme getDefaultTextTheme(BuildContext context) {
    return TextTheme(
      headline: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
      body1: TextStyle(fontSize: 26.0,  fontStyle: FontStyle.italic, fontWeight: FontWeight.normal),
    );
  }

//Example of extending the parent theme
  static TextTheme getItalicTitleTextTheme(BuildContext context) {
    return Theme.of(context).textTheme.copyWith(title: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),);
  }
}