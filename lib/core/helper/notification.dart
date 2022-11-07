import 'package:awesome_notifications/awesome_notifications.dart';

reminder(title, time) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1233,
        channelKey: 'basic_channel',
        title: title,
        body: 'now is 5 seconds later',
        wakeUpScreen: true,
        category: NotificationCategory.Alarm,
      ),
      schedule: NotificationCalendar.fromDate(date: time!));
}
