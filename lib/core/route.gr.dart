// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i5;
import 'package:flutter/material.dart' as _i4;
import 'package:notepad/view/home_view.dart' as _i1;
import 'package:notepad/view/reminder_view.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeView.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeView(),
      );
    },
    CardView.name: (routeData) {
      final args =
          routeData.argsAs<CardViewArgs>(orElse: () => const CardViewArgs());
      return _i3.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.CardView(
          key: args.key,
          currentIndex: args.index,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          HomeView.name,
          path: '/',
        ),
        _i3.RouteConfig(
          CardView.name,
          path: '/card-view',
        ),
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeView extends _i3.PageRouteInfo<void> {
  const HomeView()
      : super(
          HomeView.name,
          path: '/',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i2.CardView]
class CardView extends _i3.PageRouteInfo<CardViewArgs> {
  CardView({
    _i5.Key? key,
    dynamic index,
  }) : super(
          CardView.name,
          path: '/card-view',
          args: CardViewArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'CardView';
}

class CardViewArgs {
  const CardViewArgs({
    this.key,
    this.index,
  });

  final _i5.Key? key;

  final dynamic index;

  @override
  String toString() {
    return 'CardViewArgs{key: $key, index: $index}';
  }
}
