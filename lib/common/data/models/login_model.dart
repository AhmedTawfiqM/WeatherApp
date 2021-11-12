import 'package:firebase_auth/firebase_auth.dart';

class LoginModel {
  Future<UserCredential>  userRegister  ({
    required String password,
    required String email,
  }) async{
 var c=   FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
 return c;
  }

  Future<UserCredential>  logIn({required String email, required String password}) async{
  var c =   FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  return c;
  }
}
