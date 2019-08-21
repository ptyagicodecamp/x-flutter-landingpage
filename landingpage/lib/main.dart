//Note: This needs to be changed to flutter package for Native apps
import 'package:flutter_web/material.dart';
import 'package:landingpage/utils/themes.dart';
import 'router.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter to fly !',
      theme: MyAppThemes.AppThemeBlue(context),
      onGenerateRoute: router.generateRoute,
      initialRoute: '/',
    );
  }
}