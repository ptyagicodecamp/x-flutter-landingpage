import 'package:flutter_web/material.dart';

import 'utils/myColors.dart';
import 'widgets/body.dart';
import 'widgets/header.dart';

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
            children: <Widget>[HeaderWidget(), Body()],
          ),
        ),
      ),
    );
  }
}
