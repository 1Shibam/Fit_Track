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
  bool isVisible = true;
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
                  const BuildTextField(
                    label: 'Full Name',
                    preWidget: Icon(Icons.person),
                  ),
                  SizedBox(height: 10.h),
                  const BuildTextField(
                    label: 'Email',
                    preWidget: Icon(Icons.email),
                  ),
                  SizedBox(height: 10.h),
                  BuildTextField(
                    preWidget: const Icon(Icons.lock),
                    label: 'Password',
                    isPassword: isVisible,
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
