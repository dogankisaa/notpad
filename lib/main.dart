import 'package:flutter/material.dart';
import 'package:notepad/core/theme/theme_data.dart';
import 'package:notepad/view/home_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  
      theme: themeData(),
      home:const  HomeView(),
    );
  }

  
}
