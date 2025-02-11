import 'package:be_fit/core/constants/color_extension.dart';
import 'package:be_fit/core/constants/text_style.dart';
import 'package:be_fit/presentation/providers/router/app_route_config.dart';
import 'package:be_fit/presentation/screens/auth/auth_widgets/build_text_field.dart';
import 'package:be_fit/presentation/widgets/common%20widgets/build_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

final countDownProvider = StateProvider<int>((ref) => 30);

void showOtpDialog({
  required String codeController,
  required BuildContext context,
  required VoidCallback onPressed,
  required WidgetRef ref,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(12.w),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Enter OTP',
              style: AppTextStyles.heading3,
            ),
            SizedBox(
              height: 12.h,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Enter the OTP sent to ',
                    style: AppTextStyles.subtitle2,
                    children: [
                      TextSpan(
                          text: codeController.substring(0, 5).padRight(
                                codeController.length,
                                'X',
                              ),
                          style: AppTextStyles.body1.copyWith(
                              color: const Color.fromARGB(255, 0, 120, 6)))
                    ])),
            SizedBox(
              height: 12.h,
            ),
            const BuildTextField(
              label: 'Enter OTP',
              preWidget: Icon(Icons.verified),
            )
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                context.go('/signup');
                buildSnackBar(context, 'Something went wrong!',
                    bgColor: AppColors.primaryColorRed);
              },
              child: Text(
                'Cancel',
                style: AppTextStyles.body2,
              )),
          Consumer(
            builder: (context, ref, child) {
              final countDown = ref.watch(countDownProvider);
              return countDown > 0
                  ? Text('Resend in $countDown s')
                  : TextButton(
                      onPressed: () {
                        // Reset countdown and restart it
                        ref.read(countDownProvider.notifier).state = 30;
                        startCountdown(ref);
                      },
                      child: Text(
                        'Resend',
                        style: AppTextStyles.body2,
                      ));
            },
          ),
          TextButton(
              onPressed: () {
                ref.read(countDownProvider.notifier).state = 30;
                startCountdown(ref);
              },
              child: Text(
                'Verify',
                style: AppTextStyles.body2,
              )),
        ],
      );
    },
  );
  startCountdown(ref); // Start countdown immediately when the dialog is shown.
}

void startCountdown(WidgetRef ref) {
  // Use Future.delayed to update the countdown every second
  Future.delayed(Duration.zero, () {
    // Every second, decrement the countdown until it reaches 0
    for (int i = 30; i >= 0; i--) {
      Future.delayed(Duration(seconds: 30 - i), () {
        ref.read(countDownProvider.notifier).state = i;
      });
    }
  });
}
