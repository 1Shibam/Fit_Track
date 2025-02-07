// ignore_for_file: use_build_context_synchronously

import 'package:be_fit/common%20widgets/build_primary_button.dart';
import 'package:be_fit/common%20widgets/build_text_field.dart';
import 'package:be_fit/common%20widgets/lottie_loading_animation.dart';
import 'package:be_fit/common/color_extension.dart';
import 'package:be_fit/common/text_style.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome Back!", style: AppTextStyles.heading1),
            SizedBox(height: 8.h),
            Text("Login to continue", style: AppTextStyles.subtitle1),
            SizedBox(height: 32.h),
            const BuildTextField(
              label: 'Email',
            ),
            SizedBox(height: 16.h),
            const BuildTextField(
              label: 'Password',
            ),
            SizedBox(height: 24.h),
            const BuildPrimaryButton(text: 'Login'),
            SizedBox(height: 16.h),
            Center(
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Don\'t have an account?',
                    style: AppTextStyles.body2),
                TextSpan(
                    text: ' Sign Up',
                    style: AppTextStyles.body2
                        .copyWith(color: AppColors.primaryColorRed),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        const LottieLoadingAnimation(
                          opacity: 0.5,
                        );
                        Future.delayed(
                          const Duration(seconds: 1),
                          () {
                            context.go('/signup');
                          },
                        );
                      })
              ])),
            ),
          ],
        ),
      ),
    );
  }
}
