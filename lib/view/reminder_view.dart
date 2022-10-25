import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReminderView extends StatefulWidget {
  const ReminderView({super.key});

  @override
  State<ReminderView> createState() => _ReminderViewState();
}

class _ReminderViewState extends State<ReminderView> {
  @override
  void initState() {
    AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'call_channel',
            /* same name */
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          reminder();
        },
        child: Icon(Icons.alarm),
      ),
    );
  }

  reminder() async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 123,
          channelKey: 'call_channel',
          title: 'wait 5 seconds to show',
          body: 'now is 5 seconds later',
          wakeUpScreen: true,
          category: NotificationCategory.Alarm,
        ),
        schedule: NotificationInterval(
          interval: 10,
          timeZone: DateTime.now().timeZoneName,
          preciseAlarm: true,
        ));
  }
}
