import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theme/app_colors.dart';
import 'package:task/core/theme/app_text_styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      this.contentPadding,
      this.focusedBorder,
      this.enabledBorder,
      this.inputTextStyle,
      required this.hintText,
      this.readOnly = false,
      this.hintStyle,
      this.isObscureText,
      this.suffixIcon,
      this.maxLines = 1,
      this.prefixIcon,
      this.backgroundColor,
      this.controller,
      required this.validator});
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final String hintText;
  final TextStyle? hintStyle;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int maxLines;
  final Color? backgroundColor;
  final bool readOnly;
  final TextEditingController? controller;
  final Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      readOnly: readOnly,
      decoration: InputDecoration(
          isDense: true,
          prefixIcon: prefixIcon,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      const BorderSide(color: AppColors.primary, width: 1.3)),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      const BorderSide(color: AppColors.lightGrey, width: 1.3)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red, width: 1.3)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red, width: 1.3)),
          hintStyle: hintStyle ?? AppTextStyles.fontfont14GreyMeduim,
          hintText: hintText,
          suffixIcon: suffixIcon,
          fillColor: backgroundColor ?? AppColors.moreLightGrey,
          filled: true),
      obscureText: isObscureText ?? false,
      style: AppTextStyles.font14DarkBlueMeduim,
      textAlignVertical: TextAlignVertical.center,
      maxLines: maxLines > 1 ? null : 1,
      keyboardType: maxLines > 1 ? TextInputType.multiline : TextInputType.text,
    );
  }
}
