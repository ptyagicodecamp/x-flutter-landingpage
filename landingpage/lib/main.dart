//Note: This needs to be changed to flutter package for Native apps
import 'package:flutter/material.dart';
import 'package:landingpage/utils/themes.dart';

import 'router.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application
  // From here, everything gets started.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter to fly away!',
      theme: MyAppThemes.AppThemeBlue(context),
      onGenerateRoute: router.generateRoute,
      initialRoute: '/',
    );
  }
}
