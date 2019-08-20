import 'package:flutter/material.dart';
import 'package:landingpage/utils/myColors.dart';
import 'package:landingpage/utils/strings.dart';
import 'package:landingpage/utils/responsive_widget.dart';
//import 'dart:js' as js;
import 'package:landingpage/utils/my_platform.dart';
import '../utils/display_util.dart';

class HeaderWidget extends StatefulWidget {
  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  var links = ["Home", "Github", "Videos", "Jobs"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: buildHeader(context),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[buildLogo(context), buildHeaderLinks(context)],
    );
  }

  //Builds navigation links at the right top of landing page
  Widget buildHeaderLinks(BuildContext context) {
    if (!ResponsiveWidget.isSmallScreen(context)) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: getLinksListing(context)..add(buildLoginButton(context)),
      );
    } else {
      return PopupMenuButton(
        //child: Image.network("assets/menu.png", width: 25, height: 25),
        child: Image.asset("assets/menu.png", width: 25, height: 25),
        onSelected: (NavLinks value) {
          setState(() {
            openLink(value);
          });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<NavLinks>>[
          const PopupMenuItem(value: NavLinks.Home, child: Text("Home")),
          const PopupMenuItem(value: NavLinks.Github, child: Text("Github")),
          const PopupMenuItem(value: NavLinks.Videos, child: Text("Videos")),
          const PopupMenuItem(value: NavLinks.Jobs, child: Text("Jobs")),
        ],
      );
    }
  }

  //Builds navigation list for header
  List<Widget> getLinksListing(BuildContext context) {
    return NavLinks.values.map((link) {
      return Padding(
          padding: EdgeInsets.only(left: 18),
          child: InkWell(
              hoverColor: Theme.of(context).primaryColor,
              highlightColor: Theme.of(context).secondaryHeaderColor,
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10.0),
              child: Text(
                displayString(link),
                style: Theme.of(context).textTheme.title,
                //style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                openLink(link);
              }));
    }).toList();
  }

  void openLink(NavLinks link) {
    print("open link:" + link.toString());
    if (!MyPlatform.isMobile()) {
      //js.context.callMethod("open", [getTargetUrl(link)]);
    }
  }

  String getTargetUrl(NavLinks link) {
    String url = "";

    switch (link) {
      case NavLinks.Home:
        url = "https://flutter-to-fly.firebaseapp.com";
        break;

      case NavLinks.Github:
        url = "https://github.com/ptyagicodecamp";
        break;

      case NavLinks.Videos:
        url =
            "https://www.youtube.com/channel/UCO3_dbHasEnA2dr_U0EhMAA/videos?view_as=subscriber";
        break;

      case NavLinks.Jobs:
        url = "https://flutterjobs.info";
        break;

      default:
        url = "https://flutter-to-fly.firebaseapp.com";
    }
    print("url: " + url);
    return url;
  }

  //Builds and decorates login button
  Widget buildLoginButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          margin: EdgeInsets.only(left: 20),
          width: 120,
          height: 40,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).secondaryHeaderColor
              ], begin: Alignment.bottomRight, end: Alignment.topLeft),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).accentColor.withOpacity(0.3),
                    offset: Offset(0, 8), //Shadow starts at x=0, y=8
                    blurRadius: 8)
              ]),
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: Text(
                Strings.loginButton,
                style: TextStyle(
                    color: MyColors.white1, fontSize: 18, letterSpacing: 1),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Builds rectangle with circular corners and Text on it and next to it as title
  Widget buildLogo(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).secondaryHeaderColor
            ], begin: Alignment.bottomRight, end: Alignment.topLeft),
          ),
          child: Center(
            child: Text(
              Strings.logoTitle,
              style: Theme.of(context).textTheme.title,
              //style: TextStyle(fontSize: 30, color: MyColors.white1),
            ),
          ),
        ),
        //give some space between logo box and title
        SizedBox(
          width: 16,
        ),
        Text(
          Strings.appTitle,
          style: TextStyle(fontSize: 26),
        )
      ],
    );
  }
}
