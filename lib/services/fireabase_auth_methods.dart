
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/widgets.dart';

class FireabaseAuthMethods {
  final FirebaseAuth fAuth; //firebase instance
  FireabaseAuthMethods(this.fAuth);

  //! Signup with email
  Future<void> signUpWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    //? using context here to pass some widgets like snackbar and alret dialog for proper auth messages

    try {
      await fAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code == 'Weak-password');

    }
  }
}
