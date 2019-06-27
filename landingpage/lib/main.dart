//Note: This needs to be changed to flutter package for Native apps
import 'package:flutter_web/material.dart';
import 'package:landingpage/utils/myColors.dart';
import 'package:landingpage/widgets/header.dart';
import 'package:landingpage/widgets/body.dart';
import 'package:landingpage/utils/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter to fly !',
      theme: MyAppThemes.AppThemeBlue(context),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Add a container and provide a linear gradient.
    //basically use different shades of same color.
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [MyColors.white1, MyColors.white2])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[Header(), Body()],
          ),
        ),
      ),
    );
  }
}