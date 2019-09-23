import 'package:fb_auth/data/classes/auth_user.dart';
import 'package:flutter/material.dart';
import 'dart:core';

abstract class BaseAuthService with ChangeNotifier {
  Future<MyAuthUser> currentUser();
  Future<MyAuthUser> signIn(String email, String password);
  Future<MyAuthUser> googleSignIn();
  Future<MyAuthUser> updateUser(MyAuthUser user);
  Future<MyAuthUser> createUser(
      String firstName, String lastName, String email, String password);
  Future<void> signOut();
}

class MyAuthUser extends AuthUser {
  final String uid;
  final String displayName;
  final String email;
  final String photoUrl;
  final bool isEmailVerified;
  final bool isAnonymous;

  MyAuthUser(
      {@required this.uid,
      @required this.displayName,
      @required this.email,
      @required this.isEmailVerified,
      @required this.isAnonymous,
      @required this.photoUrl});

  @override
  String toString() {
    return '$displayName';
  }
}
