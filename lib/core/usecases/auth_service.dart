import 'package:firebase_auth/firebase_auth.dart';
import 'package:seven__columns/core/shared/user.dart';
// import 'package:seven__columns/core/shared/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //! Create a user obj based on FirebaseUser
  Person _userFromFirebaseUser(user) {
    return user != null ? Person(uid: user.uid) : null;
  }

  //! auth change user stream
  Stream<Person> get user {
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
    .map(_userFromFirebaseUser);
  }

  //! register with email and password
  Future registerEmailandPassword(String email, String pass) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      FirebaseUser person = result.user;
      return _userFromFirebaseUser(person);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //! sign in with email and password
  Future signInWithEmailandPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //! sign out
  Future logout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
