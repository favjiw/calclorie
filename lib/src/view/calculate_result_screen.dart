import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:calclorie/src/themes/themes.dart';

class CalculateResultScreen extends StatelessWidget {
  final double result;

  const CalculateResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.mainWhite,
      appBar: AppBar(
        title: const Text('Your Result'),
        backgroundColor: ColorApp.mainWhite,
        centerTitle: true,
        titleTextStyle: TypographyApp.headingBlack,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Total Daily Calorie Needs',
              style: TypographyApp.headingBlack.copyWith(fontSize: 20.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(25.w),
              decoration: BoxDecoration(
                color: ColorApp.blueButton.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: ColorApp.blueButton, width: 1.5),
              ),
              child: Column(
                children: [
                  Text(
                    '${result.toStringAsFixed(2)} kcal',
                    style: TypographyApp.headingOrange.copyWith(fontSize: 40.sp),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'is your estimated daily calorie requirement.',
                    style: TypographyApp.subHeading.copyWith(fontSize: 15.sp),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorApp.blueButton,
                minimumSize: Size(double.infinity, 55.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Text('Back to Form', style: TypographyApp.whiteOnBtn),
            ),
          ],
        ),
      ),
    );
  }
}
