import 'package:be_fit/core/constants/color_extension.dart';
import 'package:be_fit/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AlternateOptions extends StatelessWidget {
  const AlternateOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 12.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Divider(
                color: AppColors.neutralColorMediumGray,
                thickness: 1.h,
              ),
            ),
            SizedBox(
              width: 10.h,
            ),
            Text(
              'OR',
              style: AppTextStyles.body1,
            ),
            SizedBox(
              width: 10.h,
            ),
            Expanded(
              child: Divider(
                color: AppColors.neutralColorMediumGray,
                thickness: 1.h,
              ),
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                child: SvgPicture.asset(
              'assets/images/google_icon.svg',
              height: 48.h,
              width: 48.w,
            )),
            GestureDetector(
                child: SvgPicture.asset(
              'assets/images/facebook icon.svg',
              height: 48.h,
              width: 48.w,
            )),
            GestureDetector(
                onTap: () => context.go('/phoneSignup'),
                child: SvgPicture.asset(
                  'assets/images/phone.svg',
                  height: 48.h,
                  width: 48.w,
                )),
          ],
        )
      ],
    );
  }
}
