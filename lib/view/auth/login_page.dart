import 'package:be_fit/common%20widgets/build_primary_button.dart';
import 'package:be_fit/common%20widgets/build_text_field.dart';
import 'package:be_fit/common/color_extension.dart';
import 'package:be_fit/common/text_style.dart';

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
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Center(
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
                preWidget: Icon(
                  Icons.email,
                  color: AppColors.primaryColorOrange,
                  size: 24.h,
                ),
                label: 'Email',
              ),
              SizedBox(height: 16.h),
              BuildTextField(
                label: 'Password',
                isPassword: isVisible,
                preWidget: Icon(
                  Icons.lock,
                  color: AppColors.primaryColorOrange,
                  size: 24.h,
                ),
                suffWidget: IconButton(
                    onPressed: () => setState(() {
                          isVisible = !isVisible;
                        }),
                    icon: Icon(
                        isVisible ? Icons.visibility_off : Icons.visibility),
                    color: isVisible
                        ? AppColors.neutralColorMediumGray
                        : AppColors.primaryColorOrange),
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
                          context.go('/signup');
                        })
                ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
