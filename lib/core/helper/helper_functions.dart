import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(error, style: const TextStyle(color: Colors.white)),
      duration: const Duration(seconds: 2),
    ),
  );
}

bool isValidCoordinate(String value) {
  final coordinateRegex = RegExp(r'^-?\d+\.\d{4,7}$');
  if (coordinateRegex.hasMatch(value)) {
    double coordinate = double.parse(value);

    return (coordinate >= -90 && coordinate <= 90) ||
        (coordinate >= -180 && coordinate <= 180);
  }
  return false;
}
