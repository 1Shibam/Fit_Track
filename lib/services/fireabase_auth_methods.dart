// ignore_for_file: use_build_context_synchronously

import 'package:be_fit/common%20widgets/build_snackbar.dart';
import 'package:be_fit/common/color_extension.dart';
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
      await emailVerification(context);
    } on FirebaseAuthException catch (e) {
      print(e.code == 'Weak-password');
    }
  }

  //! Email verification can't let fake emails sign up can we?

  Future<void> emailVerification(BuildContext context) async {
    try {
      await fAuth.currentUser!.sendEmailVerification();
    } on FirebaseException catch (e) {
      buildSnackBar(context, e.message.toString(),
          bgColor: AppColors.primaryColorRed);
    }
  }
}
