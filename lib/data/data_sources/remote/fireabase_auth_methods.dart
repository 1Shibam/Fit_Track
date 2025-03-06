
import 'package:be_fit/presentation/widgets/common%20widgets/build_snackbar.dart';
import 'package:be_fit/core/constants/color_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth; //initialize firebase instance
  FirebaseAuthMethods(this._auth);

  //! Signup with email
  Future<void> signUpWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    //? using context here to pass some widgets like snackbar and alret dialog for proper auth messages

    try {
      final userCreds = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (context.mounted) {
        if (!userCreds.user!.emailVerified) {
          await sendEmailVerification(context);
        }
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
      String errorMessage = 'Login failed';
      print(e.code);

      switch (e.code) {
        case 'invalid-credential':
          errorMessage = 'There is no user with this email';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password';
          break;

        case 'user-disabled':
          errorMessage = 'The user account has been disabled';
          break;
      }
      if (context.mounted) {
        buildSnackBar(context, errorMessage,
            bgColor: AppColors.primaryColorRed);
      }
    } catch (e) {
      if (context.mounted) {
        buildSnackBar(context, 'unexpected error occured!',
            bgColor: AppColors.primaryColorRed);
      }
    }
  }

  //! Email verification can't let fake emails sign up can we?

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      await _auth.currentUser!.sendEmailVerification();
      if (context.mounted) {
        buildSnackBar(context, 'Email verification sent!',
            bgColor: AppColors.secondaryColorGreen);
      }
    } on FirebaseException catch (e) {
      buildSnackBar(context, e.message.toString(),
          bgColor: AppColors.primaryColorRed);
    }
  }



  // //! Phone sign-in(only for android and IOS )
  // Future<void> signInWithPhone(BuildContext context, String phoneNumber) async {
  //   TextEditingController codeController = TextEditingController();
  //   await _auth.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     //it only works for android with this we are checking if we have receieved any otp on the phone or not it wont be necessary for user to fill in that otp it will be automatic
  //     verificationCompleted: (phoneAuthCredential) async {
  //       //verification completed successful -
  //       await _auth.signInWithCredential(phoneAuthCredential);
  //     },
  //     verificationFailed: (error) {
  //       //verification failed
  //       buildSnackBar(
  //           context, 'Verification Failet Please try again - ${error.message}',
  //           bgColor: AppColors.primaryColorRed);
  //     },
  //     //in this the user has to enter the otp mainly for ios as androids handle this automatically
  //     codeSent: (verificationId, forceResendingToken) async {
  //       //code sent -
  //       ShowOTPDialog(
  //           codeController: codeController,
  //           context: context,
  //           onPressed: () async {
  //             PhoneAuthCredential cred = PhoneAuthProvider.credential(
  //                 verificationId: verificationId,
  //                 smsCode: codeController.text.trim());
  //             await _auth.signInWithCredential(cred);
  //             if(context.mounted)Navigator.of(context).pop();
  //           });

  //       buildSnackBar(context, 'OTP Sent',
  //           bgColor: AppColors.secondaryColorGreen);
  //     },
  //     codeAutoRetrievalTimeout: (verificationId) {},
  //   );
  // }
}
