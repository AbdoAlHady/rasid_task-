import 'package:flutter/material.dart';

class CustomTitleWithDescription extends StatelessWidget {
  const CustomTitleWithDescription({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      textBaseline: TextBaseline.ideographic,
      verticalDirection: VerticalDirection.down,
      children: [
        Text(
          '$title: ',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
