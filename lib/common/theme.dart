// ThemeData for input decorations
import 'package:be_fit/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ThemeData appTheme = ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: AppColors.primaryColorOrange,
    suffixIconColor: AppColors.primaryColorOrange,
    floatingLabelStyle: TextStyle(color: AppColors.primaryColorOrange),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AppColors.neutralColorMediumGray),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: BorderSide(color: AppColors.primaryColorOrange, width: 2),
    ),
    activeIndicatorBorder: BorderSide(
      color: AppColors.primaryColorOrange, width: 1
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
  ),
);
