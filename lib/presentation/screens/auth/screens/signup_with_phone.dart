import 'package:be_fit/core/constants/color_extension.dart';
import 'package:be_fit/core/constants/text_style.dart';
import 'package:be_fit/presentation/screens/auth/auth_widgets/build_primary_button.dart';
import 'package:be_fit/presentation/screens/auth/auth_widgets/show_otp_dialog.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignupWithPhone extends ConsumerStatefulWidget {
  const SignupWithPhone({super.key});

  @override
  ConsumerState<SignupWithPhone> createState() => _SignupWithPhoneState();
}

class _SignupWithPhoneState extends ConsumerState<SignupWithPhone> {
  final TextEditingController phoneNumController = TextEditingController();

  String num = '';

  @override
  void dispose() {
    phoneNumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => context.go('/signup'),
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryColorOrange,
            )),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Sign Up with Phone number',
              style: AppTextStyles.heading3,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),
            InternationalPhoneNumberInput(
              autoValidateMode: AutovalidateMode.always,
              textStyle: AppTextStyles.body1,
              onInputChanged: (PhoneNumber number) {
                num = number.phoneNumber ?? '';
              },
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.DIALOG,
                leadingPadding: 5, // Reduce the padding around the flag
                trailingSpace:
                    false, // Remove trailing space to make it more compact
              ),
              initialValue: PhoneNumber(isoCode: 'IN'),
              textFieldController: phoneNumController,
              formatInput: true,
              inputDecoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Phone number',
                  labelStyle: AppTextStyles.body2),
              selectorTextStyle: AppTextStyles
                  .body2, // Adjust the font size of the country code
              hintText: 'Enter your number',
            ),
            SizedBox(height: 32.h),
            GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return ShowOTPDialog(phnNumber: num);
                    },
                  );
                },
                child: const BuildPrimaryButton(text: 'Send OTP')),
            SizedBox(
              height: 20.h,
            ),
            TextButton(
                onPressed: () => context.go('/signup'),
                child: Text(
                  'Go Back',
                  style: AppTextStyles.body1
                      .copyWith(color: AppColors.primaryColorOrange),
                ))
          ]),
        ),
      ),
    );
  }
}
