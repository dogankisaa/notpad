import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:notepad/core/theme/theme_data.dart';
import 'package:notepad/view/home_view.dart';
import 'package:notepad/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('title');
  await Hive.openBox('date');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<HomeViewModel>(
        create: (context) => HomeViewModel(),
      ),
    ],
    builder: (context, child) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData(),
      home: const HomeView(),
    );
  }
}
