import 'package:flutter/material.dart';

import 'package:seller/src/modules/auth/presentation/routes/routers.dart';

import 'package:seller/src/modules/splash/presentation/screens/splash_screen.dart';

import 'package:seller/src/modules/navigation/external/singletons/navigation_singleton.dart';

class Navigation {
  static GlobalKey<NavigatorState> get navigatorKey =>
      NavigationSingleton.instance.navigator;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // ignore: prefer_typing_uninitialized_variables
    late final Widget _widget;
    // ignore: unused_local_variable
    late final _args = settings.arguments;

    switch (settings.name) {
      case SplashScreen.pathRoot:
        _widget = const SplashScreen();
        break;
      case AuthRoutes.pathRoot:
        _widget = const AuthRoutes();
        break;
      default:
        _widget = const AuthRoutes();
        break;
    }

    return MaterialPageRoute(builder: (BuildContext context) => _widget);
  }
}
