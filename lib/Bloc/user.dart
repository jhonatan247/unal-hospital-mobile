import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:me_cuido/Repository/auth.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRespository();

  Stream<FirebaseUser> _streamFirebaseAuth =
      FirebaseAuth.instance.onAuthStateChanged;

  Stream<FirebaseUser> get authStatus => _streamFirebaseAuth;

  Future<FirebaseUser> signIn() {
    return _auth_repository.signInFirebase();
  }

  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
