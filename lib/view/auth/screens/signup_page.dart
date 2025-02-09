import 'package:be_fit/common%20widgets/build_snackbar.dart';
import 'package:be_fit/services/fireabase_auth_methods.dart';
import 'package:be_fit/view/auth/auth_widgets/alternate_options.dart';
import 'package:be_fit/view/auth/auth_widgets/build_primary_button.dart';
import 'package:be_fit/view/auth/auth_widgets/build_text_field.dart';
import 'package:be_fit/common/color_extension.dart';
import 'package:be_fit/common/text_style.dart';
import 'package:dashed_rect/dashed_rect.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //! Text Editing controllers

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool checkBoxController = false;
  //! Focus nodes
  final nameFocus = FocusNode();
  final emailFocus = FocusNode();
  final passFocus = FocusNode();

  //! bool for password visibitly toggle
  bool isVisible = true;
  bool isAlerted = false;

  //! Form key
  final formKey = GlobalKey<FormState>();

  /// Handle form submission
  void submitForm() async {
    if (formKey.currentState!.validate() && checkBoxController == true) {
      // Process Signup
      FireabaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
          email: emailController.text,
          password: passController.text,
          context: context);

      buildSnackBar(context, 'Email Verification sent successfully!',
          bgColor: AppColors.secondaryColorGreen);
      // context.go('/completeProfile');
    } else {
      buildSnackBar(
        context,
        'Please enter the fields correctly',
      );
      setState(() {
        isAlerted = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign Up", style: AppTextStyles.heading1),
            SizedBox(height: 20.h),
            Form(
              key: formKey,
              child: Column(
                children: [
                  BuildTextField(
                    controller: nameController,
                    focusNode: nameFocus,
                    label: 'Full Name',
                    preWidget: const Icon(Icons.person),
                    submitField: (_) {
                      if (nameController.text.trim().isNotEmpty) {
                        FocusScope.of(context).requestFocus(emailFocus);
                      }
                    },
                    validator: validateName,
                  ),
                  SizedBox(height: 10.h),
                  BuildTextField(
                    controller: emailController,
                    focusNode: emailFocus,
                    label: 'Email',
                    preWidget: const Icon(Icons.email),
                    submitField: (_) {
                      if (nameController.text.trim().isNotEmpty) {
                        FocusScope.of(context).requestFocus(passFocus);
                      }
                    },
                    validator: validateEmail,
                  ),
                  SizedBox(height: 10.h),
                  BuildTextField(
                    controller: passController,
                    focusNode: passFocus,
                    preWidget: const Icon(Icons.lock),
                    label: 'Password',
                    isPassword: isVisible,
                    validator: validatePassword,
                    submitField: (_) => FocusScope.of(context).unfocus(),
                    suffWidget: IconButton(
                        onPressed: () => setState(() {
                              isVisible = !isVisible;
                            }),
                        icon: Icon(
                          isVisible ? Icons.visibility_off : Icons.visibility,
                          color: isVisible
                              ? AppColors.neutralColorMediumGray
                              : AppColors.primaryColorOrange,
                        )),
                  ),
                  SizedBox(height: 16.h),
                  isAlerted
                      ? DashedRect(
                          color: Colors.red,
                          strokeWidth: 2.h,
                          gap: 5, // Space between dashes

                          child: Row(
                            children: [
                              Checkbox(
                                side: const BorderSide(
                                    color: Colors.orange, width: 3),
                                checkColor: AppColors.neutralColorSoftWhite,
                                activeColor: AppColors.primaryColorOrange,
                                value: checkBoxController,
                                onChanged: (value) {
                                  setState(() {
                                    checkBoxController = !checkBoxController;
                                  });
                                },
                              ),
                              Expanded(
                                child: Text(
                                  'by continuing you accept out privacy policy and terms of use',
                                  style: AppTextStyles.body2.copyWith(
                                      color: AppColors.primaryColorRed),
                                ),
                              )
                            ],
                          ),
                        )
                      : Row(
                          children: [
                            Checkbox(
                              side: const BorderSide(
                                  color: Colors.orange, width: 3),
                              checkColor: AppColors.neutralColorSoftWhite,
                              activeColor: AppColors.primaryColorOrange,
                              value: checkBoxController,
                              onChanged: (value) {
                                setState(() {
                                  checkBoxController = !checkBoxController;
                                });
                              },
                            ),
                            Expanded(
                              child: Text(
                                'by continuing you accept out privacy policy and terms of use',
                                style: AppTextStyles.body2,
                              ),
                            )
                          ],
                        ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
                onTap: submitForm,
                child: const BuildPrimaryButton(text: 'Sign Up')),
            SizedBox(height: 10.h),
            RichText(
              text: TextSpan(
                text: "Already have an account? ",
                style: AppTextStyles.body2.copyWith(color: Colors.black),
                children: [
                  TextSpan(
                    text: "Log in",
                    style: AppTextStyles.body1
                        .copyWith(color: AppColors.primaryColorOrange),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => context.go('/login'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const AlternateOptions()
          ],
        ),
      ),
    );
  }
}

/// name validation function
String? validateName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'name cant be empty';
  }
  return null;
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
