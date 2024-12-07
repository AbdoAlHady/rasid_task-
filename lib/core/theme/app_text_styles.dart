import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theme/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle fontfont14GreyMeduim = TextStyle(
    fontSize: 14.sp,
    color: Colors.grey,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font14DarkBlueMeduim = TextStyle(
    fontSize: 14.sp,
    color: AppColors.darkBlue,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font15WhiteMeduim = TextStyle(
    fontSize: 15.sp,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
}
