import 'package:task/model/notification_model.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  const LocalNotificationService._();

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void onTap(NotificationResponse response) {}
  static Future<void> init() async {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    // await _requestNotificationPermission();
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(settings,
        // Work when i want to do something when i taped notification when the app is oppened
        onDidReceiveNotificationResponse: onTap,
        // Work when i want to do something when i taped notification when the app is closed
        onDidReceiveBackgroundNotificationResponse: onTap);
  }

  static Future<void> showBasicNotification(
      {required String title, required String body, required int id}) async {
    AndroidNotificationDetails android = const AndroidNotificationDetails(
      "basic_channel",
      "Basic Channel",
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: android,
      iOS: const DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.show(
        id, title, body, notificationDetails);
  }

  static Future<void> showScheduledNotification(
    NotificationModel notificationModel,
  ) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails('channel_id', 'channel_name',
            importance: Importance.high, priority: Priority.high);

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    var scheduleTime = tz.TZDateTime(
      tz.local,
      notificationModel.date.year,
      notificationModel.date.month,
      notificationModel.date.day,
      notificationModel.date.hour,
      notificationModel.date.minute,
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
      notificationModel.id,
      notificationModel.title,
      notificationModel.body,
      scheduleTime,
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exact,
    );
  }

  //! Cancel Notification
  static void cancelNotification({required int notificationId}) async {
    await flutterLocalNotificationsPlugin.cancel(notificationId);
  }

  //! Cancel All Notification
  static void cancelAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  static Future<List<PendingNotificationRequest>>
      getPendingNotifications() async {
    return await flutterLocalNotificationsPlugin.pendingNotificationRequests();
  }
}
