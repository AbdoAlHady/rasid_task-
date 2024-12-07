import 'package:flutter/material.dart';

class NotificationModel {
  final String title;
  final String body;
  final int id;
  final DateTime date;
  final TimeOfDay time;

  NotificationModel(
      {required this.title,
      required this.body,
      required this.id,
      required this.time,
      required this.date});
}
