import 'package:calclorie/src/themes/themes.dart';
import 'package:calclorie/src/widgets/app_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'calculate_result_screen.dart';

class CalculateFormScreen extends StatefulWidget {
  const CalculateFormScreen({super.key});

  @override
  State<CalculateFormScreen> createState() => _CalculateFormScreenState();
}

class _CalculateFormScreenState extends State<CalculateFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController weightCtr = TextEditingController();
  final TextEditingController heightCtr = TextEditingController();
  final TextEditingController ageCtr = TextEditingController();

  String _gender = 'Male';
  String _activity = 'sedentary';
  double weight = 0;
  double height = 0;
  int age = 0;
  String result = '';

  @override
  void dispose() {
    weightCtr.dispose();
    heightCtr.dispose();
    ageCtr.dispose();
    super.dispose();
  }

  void _submit() {
    final valid = _formKey.currentState?.validate() ?? false;
    if (!valid) return;
    weight = double.parse(weightCtr.text);
    height = double.parse(heightCtr.text);
    age = int.parse(ageCtr.text);
  }

  double _calculateTotalCalories() {
    final bmr = _calculateBMR();
    double multiplier;

    switch (_activity) {
      case 'sedentary':
        multiplier = 1.2;
        break;
      case 'lightly_active':
        multiplier = 1.375;
        break;
      case 'moderately_active':
        multiplier = 1.55;
        break;
      case 'very_active':
        multiplier = 1.725;
        break;
      case 'super_active':
        multiplier = 1.9;
        break;
      default:
        multiplier = 1.2;
    }

    return bmr * multiplier;
  }

  double _calculateBMR() {
    if (_gender == 'Male') {
      return 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      return 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: ColorApp.mainWhite,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.h),
                  Row(
                    children: [
                      Text('Calculate ', style: TypographyApp.headingOrange),
                      Text('your Calorie', style: TypographyApp.headingBlack),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Please fill out this form.',
                    style: TypographyApp.subHeading,
                  ),
                  SizedBox(height: 20.h),
                  Text('Weight', style: TypographyApp.label),
                  SizedBox(height: 12.h),
                  AppTextInput(
                    controller: weightCtr,
                    prefixIcon: Image.asset('assets/images/kg_ic.png'),
                    hintText: 'Enter your weight (kg).',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your weight';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      if (double.parse(value) <= 0) {
                        return 'Please enter a positive number';
                      }
                      if (double.parse(value) > 300) {
                        return 'Please enter a number less than 300';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                  Text('Height', style: TypographyApp.label),
                  SizedBox(height: 12.h),
                  AppTextInput(
                    controller: heightCtr,
                    prefixIcon: Image.asset('assets/images/height_ic.png'),
                    hintText: 'Enter your height (cm).',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your height';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      if (double.parse(value) <= 0) {
                        return 'Please enter a positive number';
                      }
                      if (double.parse(value) > 250) {
                        return 'Please enter a number less than 250';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                  Text('Age', style: TypographyApp.label),
                  SizedBox(height: 12.h),
                  AppTextInput(
                    controller: ageCtr,
                    hintText: 'Enter your age.',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your age';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      if (int.parse(value) <= 0) {
                        return 'Please enter a positive number';
                      }
                      if (int.parse(value) > 100) {
                        return 'Please enter a number less than 100';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                  Text('Gender', style: TypographyApp.label),
                  SizedBox(height: 12.h),
                  RadioGroup<String>(
                    groupValue: _gender,
                    onChanged: (v) => setState(() => _gender = v ?? _gender),
                    child: Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            title: const Text('Male'),
                            value: 'Male',
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            title: const Text('Female'),
                            value: 'Female',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text('Activity', style: TypographyApp.label),
                  SizedBox(height: 12.h),
                  RadioGroup<String>(
                    groupValue: _activity,
                    onChanged: (v) => setState(() => _activity = v ?? _activity),
                    child: Column(
                      children: [
                        RadioListTile<String>(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title:
                          const Text('Sedentary (little or no exercise)'),
                          value: 'sedentary',
                        ),
                        RadioListTile<String>(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: const Text(
                              'Lightly active (light exercise/sports 1-3 days/week)'),
                          value: 'lightly_active',
                        ),
                        RadioListTile<String>(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: const Text(
                              'Moderately active (moderate exercise/sports 3-5 days/week)'),
                          value: 'moderately_active',
                        ),
                        RadioListTile<String>(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: const Text(
                              'Very active (hard exercise/sports 6-7 days a week)'),
                          value: 'very_active',
                        ),
                        RadioListTile<String>(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: const Text(
                              'Super active (very hard exercise/sports & physical job or 2x training)'),
                          value: 'super_active',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 70.h),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: SizedBox(
          width: double.infinity,
          height: 73.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 11.h),
            child: ElevatedButton(
              onPressed: () {
                _submit();
                if (_formKey.currentState!.validate()) {
                  final totalCalories = _calculateTotalCalories();
                  FocusScope.of(context).unfocus();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CalculateResultScreen(result: totalCalories),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorApp.blueButton,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Text('Calculate', style: TypographyApp.whiteOnBtn),
            ),
          ),
        ),
      ),
    );
  }
}
