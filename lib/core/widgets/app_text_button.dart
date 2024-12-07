import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theme/app_colors.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key,
      this.borderRadius,
      this.backgroundColor,
      this.verticalPadding,
      this.horizontalPadding,
      this.buttonHeight,
      this.buttonWidth,
      required this.buttonText,
      required this.textStyle,
      required this.onPressed});
  final double? borderRadius;
  final Color? backgroundColor;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? buttonHeight;
  final double? buttonWidth;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 16,
            ),
          ),
          backgroundColor: backgroundColor ?? AppColors.primary,
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding?.h ?? 14.h,
              horizontal: horizontalPadding?.w ?? 12.w),
          fixedSize: Size(
              buttonWidth?.w ?? double.maxFinite, buttonHeight?.h ?? 52.h)),
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}
