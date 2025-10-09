import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'themes.dart';

class TypographyApp {
  static TextStyle get splash => TextStyle(
    fontFamily: 'Poppins',
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
    color: ColorApp.mainOrange,
  );

  static TextStyle get headingOrange => TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: ColorApp.mainOrange,
  );

  static TextStyle get headingBlack => TextStyle(
    fontFamily: 'Poppins',
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: ColorApp.mainBlack,
  );

  static TextStyle get subHeading => TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: ColorApp.greyInactive,
  );

  static TextStyle get label => TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: ColorApp.mainBlack,
  );

  static TextStyle get hint => TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorApp.greyHint,
  );
  static TextStyle get body => TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorApp.mainBlack,
  );

  static TextStyle get whiteOnBtn => TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: ColorApp.mainWhite,
  );
}