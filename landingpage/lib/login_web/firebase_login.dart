import 'package:firebase/firebase.dart';
import 'package:flutter_web/material.dart';
import 'package:landingpage/login_web/auth_service.dart';
import 'package:landingpage/login_web/login_page.dart';
import 'package:landingpage/login_web/user_profile.dart';
import 'package:provider/provider.dart';

//user Firebase Auth to login using Google account credentials
class FirebaseAuthLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirebaseAuthLoginState();
  }
}

class _FirebaseAuthLoginState extends State<FirebaseAuthLogin> {
  @override
  Widget build(BuildContext context) {
    return body();
  }

  FutureBuilder body() {
    return FutureBuilder<User>(
      future: Provider.of<FireAuthService>(context).currentUser(),
      builder: (context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.error != null) {
            return Text(snapshot.error.toString());
          }

          if (snapshot.hasData) {
            return UserProfilePage(context, snapshot.data);
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
}
