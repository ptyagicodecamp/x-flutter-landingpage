import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:landingpage/login/login_page.dart';
import 'package:landingpage/login/user_profile.dart';
import 'package:landingpage/plugins/firebase/change_notifier.dart';
import 'package:landingpage/plugins/firebase/fire_auth_service.dart';
import 'package:provider/provider.dart';
import 'package:landingpage/router.dart' as router;

//user Firebase Auth to login using Google account credentials
class FirebaseAuthLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirebaseAuthLoginState();
  }
}

class _FirebaseAuthLoginState extends State<FirebaseAuthLogin> {
  static MyAuthUser user;

  @override
  Widget build(BuildContext context) {
    return body();
  }

  FutureBuilder body() {
    return FutureBuilder<MyAuthUser>(
      future: Provider.of<FireAuthService>(context).currentUser(),
      builder: (context, AsyncSnapshot<MyAuthUser> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.error != null) {
            return Text(snapshot.error.toString());
          }

          if (snapshot.hasData) {
            user = snapshot.data;

            return UserProfilePage(
                currentUser: user, onSignOut: () => signOut());
          }

          return LogInPage(title: 'Login');
        } else {
          return Container(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  void signOut() {
    Navigator.popAndPushNamed(context, router.HOME);
  }
}
