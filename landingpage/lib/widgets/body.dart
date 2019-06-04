import 'package:flutter/material.dart';
import 'package:landingpage/utils/strings.dart';
import 'package:landingpage/utils/myColors.dart';
import 'package:landingpage/widgets/emailBox.dart';

class Body extends StatelessWidget {
  var backgroundImage = "assets/flutter_image.jpg";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          addBackground(),
          addWelcomeText()
        ],
      ),
    );
  }

  //Adds background Image
  Widget addBackground() {
    return FractionallySizedBox(
      alignment: Alignment.centerRight, //to keep images aligned to right
      widthFactor: .6, //covers about 60% of the screen width
      child: Image.network(
        backgroundImage,
        scale: .85,
      ),
    );
  }

  //Adds welcome text
  Widget addWelcomeText() {
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
                style: TextStyle(
                  fontSize: 60,
                  color: MyColors.blue4
                ),
                children: [
                  TextSpan(
                    text: Strings.ftf,
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54
                    )
                  )
                ]
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: Text(Strings.subscribeText),
            ),
            SizedBox(height: 40,), //Give some spacing
            EmailBox()
          ],
        ),
      ),
    );
  }
}
