import 'package:flutter/material.dart';
import 'package:landingpage/plugins/firetop/change_notifier.dart';
import 'package:provider/provider.dart';

import 'data/reources.dart';
import 'home.dart';
import 'login/firebase_login.dart';
import 'login/user_profile.dart';
import 'package:landingpage/plugins/firetop/fire_auth_service.dart';

const String HOME = '/';
const String FACTS_DIALOGFLOW = "FACTS_DIALOGFLOW";
const String FIREBASE_LOGIN = 'FIREBASE_LOGIN';
const String USER_PROFILE = 'USER_PROFILE';
const String FLUTTER_RESOURCES = 'FLUTTER_RESOURCES';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HOME:
      return MaterialPageRoute(builder: (context) => MyHomePage());
      break;

    case FLUTTER_RESOURCES:
      return MaterialPageRoute(builder: (context) => FlutterResources());
      break;

    case FIREBASE_LOGIN:
      return MaterialPageRoute(builder: (context) {
        return ChangeNotifierProvider<FireAuthService>(
          child: FirebaseAuthLogin(),
          builder: (BuildContext context) {
            return FireAuthService();
          },
        );
      });
      break;

    case USER_PROFILE:
      return MaterialPageRoute(builder: (context) {
        final MyAuthUser firebaseUser = routeSettings.arguments;
        return ChangeNotifierProvider<FireAuthService>(
          child: UserProfilePage(
              currentUser: firebaseUser,
              onSignOut: () {
                Navigator.pushNamed(context, HOME);
              }),
          builder: (BuildContext context) {
            return FireAuthService();
          },
        );
      });
      break;
    default:
      return MaterialPageRoute(builder: (context) => MyHomePage());
  }
}
