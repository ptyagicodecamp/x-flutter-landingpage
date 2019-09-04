import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:landingpage/home.dart';
import 'package:landingpage/login/auth_service.dart';
import 'package:landingpage/widgets/webview.dart';
import 'package:landingpage/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

//user Firebase Auth to login using Google account credentials
class UserProfilePage extends StatefulWidget {
  final FirebaseUser currentUser;

  UserProfilePage(this.currentUser);

  @override
  State<StatefulWidget> createState() {
    return _UserProfilePageState();
  }
}

class _UserProfilePageState extends State<UserProfilePage> {
  String photoUrl = "";

  @override
  Widget build(BuildContext context) {
    if (widget.currentUser.photoUrl != null) {
      photoUrl = widget.currentUser.photoUrl;
    }
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Welcome ' + widget.currentUser.displayName,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
          ),
          SizedBox(height: 20.0,),

          SizedBox(
            height: 100,
            width: 100,
            child: CircleAvatar(
              radius: 200,
              child: Image.network(photoUrl, fit: BoxFit.fitHeight,),
            ),
          ),
          SizedBox(height: 20.0,),

          RaisedButton(
            child: Text('Sign out'),
            onPressed: () async {
              await Provider.of<FireAuthService>(context).signOut();
            },
          )
        ],
      ),
    );
  }
}
