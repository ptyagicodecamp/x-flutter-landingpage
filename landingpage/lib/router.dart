import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:landingpage/login/auth_service.dart';
import 'package:landingpage/login/firebase_login.dart';
import 'package:landingpage/login/login_page.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'login/user_profile.dart';
import 'widgets/dialog_flow.dart';

const String FACTS_DIALOGFLOW = "FACTS_DIALOGFLOW";
const String FIREBASE_LOGIN = 'FIREBASE_LOGIN';
const String USER_PROFILE = 'USER_PROFILE';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch(routeSettings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => MyHomePage());
      break;

    case FACTS_DIALOGFLOW:
      return MaterialPageRoute(builder: (context) => FlutterFactsDialogFlow());
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
        final FirebaseUser firebaseUser = routeSettings.arguments;
        return UserProfilePage(firebaseUser);
      });
      break;
    default:
      return MaterialPageRoute(builder: (context) => MyHomePage());
  }
}