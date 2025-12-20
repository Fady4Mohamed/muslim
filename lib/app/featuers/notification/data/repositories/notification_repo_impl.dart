import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class NotificationRepoImpl {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  //Initialize
  Future<void> initialize() async {
    if (_isInitialized) return;

    // Initialize timezone
    tz_data.initializeTimeZones();

    if (Platform.isAndroid) {
      notificationPlugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      PermissionStatus status = await Permission.notification.status;
      if (status != PermissionStatus.granted) {
        await Permission.notification.request();
      }

      PermissionStatus alarmStatus = await Permission.scheduleExactAlarm.status;
      if (alarmStatus != PermissionStatus.granted) {
        await Permission.scheduleExactAlarm.request();
      }
    }

    const initAndroidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const initIOSSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const initSettings = InitializationSettings(
      android: initAndroidSettings,
      iOS: initIOSSettings,
    );

    await notificationPlugin.initialize(initSettings);
    _isInitialized = true;
  }

  notificationDetails() {
    const androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      sound: UriAndroidNotificationSound('athan'),
      channelDescription: 'channel_description',
      importance: Importance.max,
      priority: Priority.max,
    );
    const iosDetails = DarwinNotificationDetails();
    return const NotificationDetails(android: androidDetails, iOS: iosDetails);
  }

  Future<void> scheduleNotification({
    required int id,
    required String title,
    String? body,
    required DateTime scheduledTime,
  }) async {
    final tz.TZDateTime tzScheduledTime =
        tz.TZDateTime.from(scheduledTime, tz.local);
    await notificationPlugin.zonedSchedule(
      id,
      title,
      body,
      tzScheduledTime,
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  Future<void> cancelNotification(int id) async {
    await notificationPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await notificationPlugin.cancelAll();
  }
}
