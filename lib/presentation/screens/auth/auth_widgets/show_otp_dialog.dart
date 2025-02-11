import 'package:be_fit/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final countDownProvider = StateProvider<int>((ref) => 30);
void showOtpDialog({
  required String codeController,
  required BuildContext context,
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(16.w),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Enter OTP',
              style: AppTextStyles.subtitle1,
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              'Enter the OTP sent to you mobile number ${codeController}',
              style: AppTextStyles.body2,
            )
          ],
        ),
        actions: [
          Stack(
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend',
                    style: AppTextStyles.body2,
                  )),
            ],
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'Verify',
                style: AppTextStyles.body2,
              )),
        ],
      );
    },
  );
}

// 32:23 continue tomorrow right here....
