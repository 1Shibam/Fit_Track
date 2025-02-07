import 'package:be_fit/common/color_extension.dart';
import 'package:be_fit/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildPrimaryButton extends StatelessWidget {
  final String text;
  const BuildPrimaryButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Text(text,
            style: AppTextStyles.heading3.copyWith(color: Colors.white)),
      ),
    );
  }
}
