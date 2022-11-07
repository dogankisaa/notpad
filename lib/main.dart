import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notepad/core/route.gr.dart';

import 'package:notepad/core/theme/theme_data.dart';
import 'package:notepad/view/home_view.dart';
import 'package:notepad/view/reminder_view.dart';
import 'package:notepad/view_model/card_view_model.dart';
import 'package:notepad/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required

      debug: true);
  await Hive.initFlutter();
  var box = await Hive.openBox('todos');

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<HomeViewModel>(
        create: (context) => HomeViewModel(),
      ),
      ChangeNotifierProvider<CardViewModel>(
        create: (context) => CardViewModel(),
      ),
    ],
    builder: (context, child) => MyApp(),
  ));
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp.router(
      theme: themeData(),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
