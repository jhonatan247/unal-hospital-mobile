import 'package:firebase_auth/firebase_auth.dart';
import 'package:me_cuido/data/API/firebase_auth.dart';

class AuthRespository {
  final _firebaseAuth = FirebaseAuthAPI();
  Future<FirebaseUser> signInFirebase() => _firebaseAuth.signIn();
  signOut() => _firebaseAuth.signOut();
}
