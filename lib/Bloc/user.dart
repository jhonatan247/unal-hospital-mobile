import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:me_cuido/Models/user.dart';
import 'package:me_cuido/Repository/auth.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRespository();
  UserModel _currentUser;

  Stream<FirebaseUser> _streamFirebaseAuth =
      FirebaseAuth.instance.onAuthStateChanged;

  Stream<FirebaseUser> get authStatus => _streamFirebaseAuth;

  set currentUser(UserModel current) => _currentUser = current;
  UserModel get currentUser => _currentUser;

  Future<FirebaseUser> signIn() {
    return _authRepository.signInFirebase();
  }

  signOut() {
    _authRepository.signOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
