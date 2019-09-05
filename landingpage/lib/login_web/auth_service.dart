import 'dart:async';

import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/src/auth.dart';
import 'package:flutter_web/foundation.dart';
//import 'package:google_sign_in/google_sign_in.dart';

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
      print("Priyanka signing in...");
      var auth = await _firebaseAuth.signInWithEmailAndPassword(
          "ptyagi@ptyagi.com", "ptyagi");
      notifyListeners();
      return auth.user;
    } catch (e) {
      throw Exception(e.code);
    }
  }

  @override
  Future<User> googleSignIn() async {
//    try {
//      GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
//      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//      AuthCredential credential = GoogleAuthProvider.credential(
//        googleAuth.accessToken,
//        googleAuth.idToken,
//      );
//
//      fb.UserInfo firebaseUser =
//          (await _firebaseAuth.signInWithCredential(credential)).user;
//
//      //creates user entry after logging-in for first tie.
//      updateUser(firebaseUser);
//
//      notifyListeners();
//
//      return firebaseUser;
//    } catch (e) {
//      throw Exception(e.code);
//    }
  }

  @override
  Future<User> updateUser(User user) async {
    //Firestore _fireStore = _firebaseAuth;
//    DocumentReference documentReference =
//        _fireStore.collection('users').document(user.uid);
//
//    documentReference.setData({
//      'uid': user.uid,
//      'displayName': user.displayName,
//      'photoUrl': user.photoUrl,
//      'email': user.email,
//      'lastActive': DateTime.now()
//    }, merge: true);

    return user;
  }

  @override
  Future<User> createUser(
      String firstName, String lastName, String email, String password) async {
    var auth =
        await _firebaseAuth.createUserWithEmailAndPassword(email, password);
//    UserUpdateInfo info = UserUpdateInfo();
//    info.displayName = '$firstName $lastName';
//    await auth.user.updateProfile(info);

    return auth.user;
  }

  @override
  Future<void> signOut() async {
    _firebaseAuth.signOut();
    notifyListeners();
  }
}
