import 'package:calclorie/src/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextInput extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final String? Function(String?)? validator;

  const AppTextInput({
    super.key,
    this.hintText,
    required this.controller,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 361.w,
      height: 50.h,
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TypographyApp.hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(
              color: ColorApp.border,
              width: 1.w,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        ),
        keyboardType: TextInputType.number,
        style: TypographyApp.body,
      ),
    );
  }
}
