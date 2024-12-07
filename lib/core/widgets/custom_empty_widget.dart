import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task/core/utils/spacing.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/animation/empty.json'),
        verticalSpacing(15),
        Text(
          text,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
