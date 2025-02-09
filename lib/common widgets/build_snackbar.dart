import 'package:be_fit/common/color_extension.dart';
import 'package:be_fit/common/text_style.dart';
import 'package:flutter/material.dart';

void buildSnackBar(BuildContext context, String yapp,
    {Color? bgColor, int? sec}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      yapp,
      style: AppTextStyles.subtitle2,
    ),
    backgroundColor: bgColor ?? AppColors.neutralColorMediumGray,
    duration: Duration(seconds: sec ?? 2),
  ));
}
