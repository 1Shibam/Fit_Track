import 'package:be_fit/common%20widgets/build_primary_button.dart';
import 'package:be_fit/common%20widgets/build_text_field.dart';
import 'package:be_fit/common/color_extension.dart';
import 'package:be_fit/common/text_style.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign Up", style: AppTextStyles.heading1),
            SizedBox(height: 20.h),
            Form(
              child: Column(
                children: [
                  const BuildTextField(label: 'Full Name'),
                  SizedBox(height: 10.h),
                  const BuildTextField(label: 'Email'),
                  SizedBox(height: 10.h),
                  const BuildTextField(
                    label: 'Password',
                    isPassword: true,
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            const BuildPrimaryButton(text: 'Sign Up'),
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
          ],
        ),
      ),
    );
  }
}
