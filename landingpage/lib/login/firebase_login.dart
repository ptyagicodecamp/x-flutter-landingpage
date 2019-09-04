import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:landingpage/login/auth_service.dart';
import 'package:landingpage/login/login_page.dart';
import 'package:provider/provider.dart';
import 'user_profile.dart';
import 'login_page.dart';

//user Firebase Auth to login using Google account credentials
class FirebaseAuthLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirebaseAuthLoginState();
  }
}

class _FirebaseAuthLoginState extends State<FirebaseAuthLogin> {
  static bool noData = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LogIn Demo"),
      ),
      body: body(),
    );
  }

  Widget body() {
    Widget future = futureWidget();
    if (noData) {
      return LogInPage(title: 'Login');
    }

    return future;
  }

  FutureBuilder futureWidget() {
    return FutureBuilder<FirebaseUser>(
      future: Provider.of<FireAuthService>(context).currentUser(),
      builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.error != null) {
            return Text(snapshot.error.toString());
          }

          if (snapshot.hasData) {
            return UserProfilePage(snapshot.data);
          }

          noData = true;
          return Container();
        } else {
          return Container(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
