import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<FirebaseUser> signIn() async {
    try {
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSA =
          await googleSignInAccount.authentication;
      FirebaseUser user = await _auth.signInWithCredential(
          GoogleAuthProvider.getCredential(
              idToken: googleSA.idToken, accessToken: googleSA.accessToken));

      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  signOut() async {
    await _auth
        .signOut()
        .then((onValue) => print("Firebase session was closed"));
    googleSignIn.signOut();
    print("Google sesion was closed");
  }
}
