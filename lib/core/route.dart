import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:notepad/view/home_view.dart';
import 'package:notepad/view/reminder_view.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomeView,
      initial: true,
    ),
    AutoRoute(page: CardView),
  ],
)
class $AppRouter {}
