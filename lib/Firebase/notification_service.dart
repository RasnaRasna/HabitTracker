import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart'
    as tz; // Add this import for TZDateTime and tz.local

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("flutter_logo");

    var initialzationSettings = InitializationSettings(
      android: androidInitializationSettings,
    );
    await notificationsPlugin.initialize(
      initialzationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {},
    );
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName'));
  }

  Future shownotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(
        id, title, body, await notificationDetails());
  }

  Future<void> SheduleNotification({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
    required DateTime sheduleNotificationDateTime,
  }) async {
    DateTime currentTime = DateTime.now();

    if (sheduleNotificationDateTime.isBefore(currentTime)) {
      // The scheduled time is in the past
      return;
    }

    return notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(
        sheduleNotificationDateTime,
        tz.local,
      ),
      await notificationDetails(),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
