import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theme/app_colors.dart';
import 'package:task/core/utils/spacing.dart';

class CustomStepTitle extends StatelessWidget {
  const CustomStepTitle(
      {super.key,
      required this.title,
      required this.stepNumber,
      this.onPressed});
  final String title;
  final int stepNumber;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11,
          backgroundColor: AppColors.primary,
          child: Text(
            '$stepNumber',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.sp,
            ),
          ),
        ),
        Icon(
          Icons.arrow_forward,
          size: 15.sp,
          color: AppColors.primary,
        ),
        horizontalSpacing(5),
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (onPressed != null) ...[
          const Spacer(),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.add,
              color: AppColors.primary,
            ),
          ),
        ],
      ],
    );
  }
}
