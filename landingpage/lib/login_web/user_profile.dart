import 'package:firebase/firebase.dart';
import 'package:flutter_web/material.dart';
import 'package:landingpage/login_web/auth_service.dart';
import 'package:landingpage/utils/responsive_widget.dart';
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
  String displayName = "no name yet";

  @override
  Widget build(BuildContext context) {
    if (widget.currentUser != null) {
      if (widget.currentUser.photoURL != null) {
        photoUrl = widget.currentUser.photoURL;
      }
      if (widget.currentUser.displayName != null) {
        displayName = widget.currentUser.displayName;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    if (ResponsiveWidget.isSmallScreen(context)) {
      return smallScreen(context);
    }

    return largeScreen(context);
  }

  Widget largeScreen(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 2,
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Welcome ' + displayName,
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
                  child: profilePhoto(BuildContext),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                child: Text('Sign out'),
                onPressed: () async {
                  Navigator.pushReplacementNamed(context, "/");
                  await Provider.of<FireAuthService>(context).signOut();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget profilePhoto(BuildContext) {
    if (photoUrl != null && photoUrl.length > 2) {
      return Image.network(
        photoUrl,
        fit: BoxFit.fitHeight,
      );
    } else {
      return Container(child: Icon(Icons.person));
    }
  }

  Widget smallScreen(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Welcome ' + displayName,
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
              child: profilePhoto(BuildContext),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            child: Text('Sign out'),
            onPressed: () async {
              Navigator.pushReplacementNamed(context, "/");
              await Provider.of<FireAuthService>(context).signOut();
            },
          )
        ],
      ),
    );
  }
}
