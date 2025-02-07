import 'package:be_fit/common/color_extension.dart';
import 'package:be_fit/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTextField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;

  const BuildTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.controller,
    this.focusNode,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyles.body1,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.neutralColorMediumGray),
        ),
      ),
    );
  }
}
