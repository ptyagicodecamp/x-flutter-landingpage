//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter_web/material.dart';
import 'package:landingpage/rss_web/reources.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'login_web/auth_service.dart';
import 'login_web/firebase_login.dart';
import 'login_web/user_profile.dart';

const String FACTS_DIALOGFLOW = "FACTS_DIALOGFLOW";
const String FIREBASE_LOGIN = 'FIREBASE_LOGIN';
const String USER_PROFILE = 'USER_PROFILE';
const String FLUTTER_RESOURCES = 'FLUTTER_RESOURCES';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case '/':
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
        final User firebaseUser = routeSettings.arguments;
        return ChangeNotifierProvider<FireAuthService>(
          child: UserProfilePage(context, firebaseUser),
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
