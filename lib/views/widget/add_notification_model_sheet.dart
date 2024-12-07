import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/services/local_notification_service.dart';
import 'package:task/core/theme/app_colors.dart';
import 'package:task/core/theme/app_text_styles.dart';
import 'package:task/core/widgets/app_text_button.dart';
import 'package:task/core/widgets/app_text_from_field.dart';
import 'package:task/model/notification_model.dart';
import 'package:uuid/uuid.dart';

class AddNotificationModelSheet extends StatefulWidget {
  const AddNotificationModelSheet({super.key});

  @override
  State<AddNotificationModelSheet> createState() =>
      _AddNotificationModelSheetState();
}

class _AddNotificationModelSheetState extends State<AddNotificationModelSheet> {
  final titleController = TextEditingController();

  final bodyController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16.0,
        right: 16.0,
        top: 16.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextFormField(
              controller: titleController,
              hintText: 'Notification Title',
              validator: (p0) {},
            ),
            SizedBox(height: 10.h),
            AppTextFormField(
              controller: bodyController,
              hintText: 'Notification Body',
              validator: (p0) {},
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: AppTextButton(
                  buttonText: 'Select Date',
                  backgroundColor: AppColors.lightGrey,
                  textStyle: AppTextStyles.font15WhiteMeduim,
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (date != null) {
                      selectedDate = date;
                    }
                    setState(() {});
                  },
                )),
                const SizedBox(width: 10),
                Expanded(
                    child: AppTextButton(
                  buttonText: 'Select Time',
                  backgroundColor: AppColors.lightGrey,
                  textStyle: AppTextStyles.font15WhiteMeduim,
                  onPressed: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) {
                      selectedTime = time;
                    }
                    setState(() {});
                  },
                )),
              ],
            ),
            const SizedBox(height: 20),
            AppTextButton(
              buttonText: 'Add',
              textStyle: AppTextStyles.font15WhiteMeduim,
              onPressed: () async {
                var uuid = const Uuid();

                LocalNotificationService.showScheduledNotification(
                  NotificationModel(
                    id: uuid.v1().hashCode,
                    title: titleController.text,
                    body: bodyController.text,
                    time: selectedTime,
                    date: DateTime(
                      selectedDate.year,
                      selectedDate.month,
                      selectedDate.day,
                      selectedTime.hour,
                      selectedTime.minute,
                    ),
                  ),
                ).then((value) {
                  log('Notification Added');
                  titleController.clear();
                  bodyController.clear();
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                }).catchError((error) {
                  log('Error: $error');
                });
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
