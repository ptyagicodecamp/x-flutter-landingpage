import 'package:flutter/material.dart';
import 'package:landingpage/utils/strings.dart';
import 'package:landingpage/utils/myColors.dart';
import 'package:landingpage/widgets/emailBox.dart';
import 'package:landingpage/utils/responsive_widget.dart';
import 'package:landingpage/utils/themes.dart';

var backgroundImage = "assets/flutter_image.jpg";

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(),
      smallScreen: SmallScreen(),
    );
  }
}

class LargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[addBackground(), addWelcomeText(context)],
      ),
    );
  }

  //Adds background Image
  Widget addBackground() {
    return FractionallySizedBox(
      alignment: Alignment.centerRight, //to keep images aligned to right
      widthFactor: .6, //covers about 60% of the screen width
      child: Image.asset(
        backgroundImage,
        scale: .85,
      ),
    );
  }

  //Adds welcome text
  Widget addWelcomeText(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.centerLeft, //text aligned to left side
      widthFactor: .6, //covers about half of the screen
      child: Padding(
        padding: EdgeInsets.only(left: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Strings.hello,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60,
                color: MyColors.blue4,
              ),
            ),
            RichText(
              text: TextSpan(
                  text: Strings.welcomeTo,
                  style: TextStyle(fontSize: 60, color: MyColors.blue4),
                  children: [
                    TextSpan(
                        text: Strings.ftf,
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54)
                    )
                  ]),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: Text(Strings.subscribeText),
            ),
            SizedBox(
              height: 40,
            ), //Give some spacing
            EmailBox(),
          ],
        ),
      ),
    );
  }
}

class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              Strings.hello,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: MyColors.blue4,
              ),
            ),
            RichText(
              text: TextSpan(
                  text: Strings.welcomeTo,
                  style: TextStyle(fontSize: 40, color: MyColors.blue4),
                  children: [
                    TextSpan(
                        text: Strings.ftf,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54))
                  ]),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
//              child: Image.asset(
//                backgroundImage,
//                scale: 1,
//              ),
              child: Image.network("https://firebasestorage.googleapis.com/v0/b/fir-recipes-b5611.appspot.com/o/images%2Fflutter_banner.png?alt=media&token=f4e81497-ca05-47f7-b5a8-a4f6bbe2239e"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: Text(Strings.subscribeText),
            ),
            SizedBox(
              height: 30,
            ),
            EmailBox(),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
