// ignore_for_file: use_build_context_synchronously

import 'package:be_fit/presentation/widgets/common%20widgets/build_snackbar.dart';
import 'package:be_fit/presentation/widgets/common%20widgets/lottie_loading_animation.dart';

import 'package:be_fit/data/data_sources/remote/fireabase_auth_methods.dart';

import 'package:be_fit/presentation/screens/auth/auth_widgets/build_primary_button.dart';
import 'package:be_fit/presentation/screens/auth/auth_widgets/build_text_field.dart';
import 'package:be_fit/core/constants/color_extension.dart';
import 'package:be_fit/core/constants/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //! Text Editing controllers
  final emailController = TextEditingController();
  final passController = TextEditingController();

  //! Focus nodes
  final emailFocus = FocusNode();
  final passFocus = FocusNode();

  //! bool for password visibility toggle
  bool isVisible = true;

  //! Form Key for validation
  final formkey = GlobalKey<FormState>();

  /// Handle form submission
  void submitForm() async {
    if (formkey.currentState!.validate()) {
      //! showing loading dialog before login starts

      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const LottieLoadingAnimation(
            opacity: 0.4,
            height: 100,
            width: 100,
          );
        },
      );

      try {
        //Attempting to log in with email and password -
        await FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
            context, emailController.text.trim(), passController.text.trim());
        //check if email is verified -
        final user = FirebaseAuth.instance.currentUser;

        //close loading
        Navigator.pop(context);
        if (user == null) {
          
          return;
        }
        if (user.emailVerified) {
          context.go('/completeProfile');
        } else {
          Navigator.pop(context);
          buildSnackBar(context, 'Please verify you email first',
              bgColor: AppColors.primaryColorRed);
        }
      } catch (e) {
        Navigator.pop(context);
        buildSnackBar(context, e.toString(),
            bgColor: AppColors.primaryColorRed);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Center(
          child: Form(
            key: formkey, // Attach form key
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Login to continue",
                  style: AppTextStyles.heading1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),
                BuildTextField(
                  controller: emailController,
                  focusNode: emailFocus,
                  preWidget: const Icon(Icons.email),
                  label: 'Email',
                  submitField: (_) {
                    if (emailController.text.trim().isNotEmpty) {
                      FocusScope.of(context).requestFocus(passFocus);
                    }
                  },
                  validator: validateEmail, // Pass function reference
                ),
                SizedBox(height: 16.h),
                BuildTextField(
                  controller: passController,
                  focusNode: passFocus,
                  label: 'Password',
                  isPassword: isVisible,
                  preWidget: const Icon(Icons.lock),
                  suffWidget: IconButton(
                    onPressed: () => setState(() {
                      isVisible = !isVisible;
                    }),
                    icon: Icon(
                        isVisible ? Icons.visibility_off : Icons.visibility),
                    color: isVisible
                        ? AppColors.neutralColorMediumGray
                        : AppColors.primaryColorOrange,
                  ),
                  validator: validatePassword, // Pass function reference
                  submitField: (_) => submitForm(),
                ),
                SizedBox(height: 24.h),
                GestureDetector(
                  onTap: submitForm,
                  child: const BuildPrimaryButton(
                    text: 'Login',
                    // Ensure button calls submitForm()
                  ),
                ),
                SizedBox(height: 16.h),
                Center(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Don\'t have an account?',
                        style: AppTextStyles.body2,
                      ),
                      TextSpan(
                        text: ' Sign Up',
                        style: AppTextStyles.body2
                            .copyWith(color: AppColors.primaryColorRed),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.go('/signup');
                          },
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Email validation function
String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Email can\'t be empty';
  }
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  if (!emailRegex.hasMatch(value)) {
    return 'Enter a valid email';
  }
  return null;
}

/// Password validation function
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password can\'t be empty';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}
