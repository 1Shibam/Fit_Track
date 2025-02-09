import 'package:be_fit/common/color_extension.dart';
import 'package:be_fit/common/text_style.dart';
import 'package:be_fit/view/auth/auth_widgets/build_primary_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignupWithPhone extends StatefulWidget {
  const SignupWithPhone({super.key});

  @override
  State<SignupWithPhone> createState() => _SignupWithPhoneState();
}

class _SignupWithPhoneState extends State<SignupWithPhone> {
  final TextEditingController phoneNumController = TextEditingController();
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
                // print(number.phoneNumber);
                // print(number.dialCode);
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
            const BuildPrimaryButton(text: 'Send OTP'),
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
