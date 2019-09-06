import 'dart:async';

import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart';
import 'package:firebase/src/auth.dart';
import 'package:flutter_web/foundation.dart';

abstract class BaseAuthService with ChangeNotifier {
  Future<User> currentUser();
  Future<User> signIn(String email, String password);
  Future<User> googleSignIn();
  Future<User> updateUser(User user);
  Future<User> createUser(
      String firstName, String lastName, String email, String password);
  Future<void> signOut();
}

class FireAuthService extends BaseAuthService {
  final Auth _firebaseAuth = fb.auth();

  @override
  Future<User> currentUser() async {
    return await _firebaseAuth.currentUser;
  }

  @override
  Future<User> signIn(String email, String password) async {
    try {
      var auth =
          await _firebaseAuth.signInWithEmailAndPassword(email, password);
      var updated = updateUser(auth.user);
      print("Tyagi: " + updated.toString());
      notifyListeners();
      return auth.user;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<User> googleSignIn() async {
    //TODO
  }

  @override
  Future<User> updateUser(User user) async {
    final CollectionReference ref = fb.firestore().collection('users');

    String displayName = user.displayName;
    String photoUrl = user.photoURL;

    if (displayName == null) {
      displayName = "No Name yet";
    }

    if (photoUrl == null) {
      photoUrl = "";
    }

    var newData = {
      'uid': user.uid,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'email': user.email,
      'lastActive': DateTime.now()
    };

    await ref.doc(user.uid).set(newData, SetOptions(merge: true));

//    await ref.doc('ptyagi').set(newData);
//
//    var map = {"text": "hello", "createdAt": DateTime.now()};
//
//    try {
//      await ref.add(map);
//    } catch (e) {
//      print("Error while writing document, $e");
//    }

    return user;
  }

  @override
  Future<User> createUser(
      String firstName, String lastName, String email, String password) async {
    var auth =
        await _firebaseAuth.createUserWithEmailAndPassword(email, password);

    var info = fb.UserProfile();
    info.displayName = '$firstName $lastName';
    await auth.user.updateProfile(info);

    updateUser(auth.user);

    return auth.user;
  }

  @override
  Future<void> signOut() async {
    _firebaseAuth.signOut();
    notifyListeners();
  }
}
