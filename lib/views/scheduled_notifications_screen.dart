import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:task/core/services/local_notification_service.dart';
import 'package:task/views/widget/add_notification_model_sheet.dart';

class ScheduledNotificationsScreen extends StatefulWidget {
  const ScheduledNotificationsScreen({super.key});

  @override
  State<ScheduledNotificationsScreen> createState() =>
      _ScheduledNotificationsScreenState();
}

class _ScheduledNotificationsScreenState
    extends State<ScheduledNotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              LocalNotificationService.cancelAllNotification();
              setState(() {});
            },
          ),
        ],
      ),
      body: FutureBuilder<List<PendingNotificationRequest>>(
          future: LocalNotificationService.getPendingNotifications(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            List<PendingNotificationRequest> pendingNotifications =
                snapshot.data ?? [];
            return pendingNotifications.isEmpty
                ? const Center(
                    child: Text('No Scheduled Notifications'),
                  )
                : ListView.builder(
                    itemCount: pendingNotifications.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(pendingNotifications[index].title ?? ''),
                        subtitle: Text(pendingNotifications[index].body ?? ''),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            LocalNotificationService.cancelNotification(
                                notificationId: pendingNotifications[index].id);
                            setState(() {});
                          },
                        ),
                      );
                    });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const AddNotificationModelSheet();
            },
          ).whenComplete(() {
            setState(() {});
          });
        },
        child: const Icon(Icons.notification_add),
      ),
    );
  }
}
