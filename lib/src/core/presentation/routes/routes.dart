import 'package:flutter/material.dart';

import 'package:seller/src/modules/auth/presentation/screens/auth/me/me_screen.dart';
import 'package:seller/src/modules/auth/presentation/screens/auth/signup/signup_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // ignore: prefer_typing_uninitialized_variables
  late final Widget _widget;
  // ignore: unused_local_variable
  late final _args = settings.arguments;

  switch (settings.name) {
    case SignUpScreen.path:
      _widget = const SignUpScreen();
      break;
    case MeScreen.path:
      _widget = const MeScreen();
      break;
    default:
      _widget = const SignUpScreen();
      break;
  }

  return MaterialPageRoute(builder: (BuildContext context) => _widget);
}
