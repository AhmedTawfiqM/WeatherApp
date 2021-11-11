import 'package:firebase_auth/firebase_auth.dart';

class AuthWebService {


  Future<UserCredential> register({
    required String password,
    required String email,
  }) async {
    var c = FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return c;
  }

  Future<UserCredential> login(
      {required String email, required String password}) async {
    var c = FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return c;
  }
}
