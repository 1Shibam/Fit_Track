// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:be_fit/common%20widgets/build_snackbar.dart';
import 'package:be_fit/common/color_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class FireabaseAuthMethods {
  final FirebaseAuth _auth; //firebase instance
  FireabaseAuthMethods(this._auth);

  //! Signup with email
  Future<void> signUpWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    //? using context here to pass some widgets like snackbar and alret dialog for proper auth messages

    try {
      final userCreds = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await emailVerification(context);

      if (context.mounted) {
        if (!userCreds.user!.emailVerified) {
          buildSnackBar(context, 'Please verify your email',
              bgColor: AppColors.neutralColorMediumGray);
          await emailVerification(context);
        }
        context.go('/completeProfile');
      }
    } on FirebaseAuthException catch (e) {
      String errorMsg = 'An error occured during Signup!!';
      switch (e.code) {
        case 'weak-password':
          errorMsg = 'The password provided is too weak';
          break;
        case 'email-already-in-use':
          errorMsg = 'This email is already in use';
          break;
        case 'invalid-email':
          errorMsg = 'The entered email is invalid';
          break;
      }
      if (context.mounted) {
        buildSnackBar(context, errorMsg, bgColor: AppColors.primaryColorRed);
      }
    } catch (e) {
      if (context.mounted) {
        buildSnackBar(context, 'An un expected error occured!!',
            bgColor: AppColors.primaryColorRed);
      }
    }
  }

  //! Login with Email - For the user who already have and account...

  Future<void> loginWithEmail(
      BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      buildSnackBar(context, e.message.toString(),
          bgColor: AppColors.primaryColorRed);
    }
  }

  //! Email verification can't let fake emails sign up can we?

  Future<void> emailVerification(BuildContext context) async {
    try {
      await _auth.currentUser!.sendEmailVerification();
      buildSnackBar(context, 'Email verification sent!',
          bgColor: AppColors.secondaryColorGreen);
    } on FirebaseException catch (e) {
      buildSnackBar(context, e.message.toString(),
          bgColor: AppColors.primaryColorRed);
    }
  }
}
