import 'package:flutter/material.dart';
import 'package:task/core/services/local_notification_service.dart';
import 'package:task/views/scheduled_notifications_screen.dart';

class BasicNotificationScreen extends StatelessWidget {
  const BasicNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Notification Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                LocalNotificationService.showBasicNotification(
                    title: 'Basic Notification', body: 'body', id: 0);
              },
              child: const Text('Show Basic Notification'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                LocalNotificationService.cancelAllNotification();
              },
              child: const Text('cancel Notification'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ScheduledNotificationsScreen();
                }));
              },
              child: const Text('Schedule Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
