import 'package:firebase/firebase.dart';
import 'package:flutter_web/material.dart';
import 'package:landingpage/login_web/auth_service.dart';
import 'package:provider/provider.dart';

//user Firebase Auth to login using Google account credentials
class UserProfilePage extends StatefulWidget {
  final User currentUser;
  final BuildContext _buildContext;

  UserProfilePage(this._buildContext, this.currentUser);

  @override
  State<StatefulWidget> createState() {
    return _UserProfilePageState();
  }
}

class _UserProfilePageState extends State<UserProfilePage> {
  String photoUrl = "";

  @override
  Widget build(BuildContext context) {
    print("Priyanka: " + widget.currentUser.email);
    if (widget.currentUser.photoURL != null) {
      photoUrl = widget.currentUser.photoURL;
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
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: CircleAvatar(
              radius: 200,
              child: Image.network(
                photoUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
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
