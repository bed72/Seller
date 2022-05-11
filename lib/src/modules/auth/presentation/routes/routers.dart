import 'package:flutter/material.dart';

import 'package:seller/src/modules/auth/presentation/screens/auth/me/me_screen.dart';
import 'package:seller/src/modules/auth/presentation/screens/auth/signup/signup_screen.dart';

class AuthRoutes extends StatelessWidget {
  static const String pathRoot = 'auth';
  static const String pathMe = '$pathRoot/me';
  static const String pathSignIn = '$pathRoot/sign_in';

  const AuthRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: pathSignIn,
      onGenerateRoute: (RouteSettings settings) {
        late final Widget widget;
        // ignore: unused_local_variable
        late final args = settings.arguments;

        switch (settings.name) {
          case pathSignIn:
            widget = const SignUpScreen();
            break;
          case pathMe:
            widget = const MeScreen();
            break;
          default:
            widget = const SignUpScreen();
            break;
        }

        return MaterialPageRoute(builder: (BuildContext context) => widget);
      },
    );
  }
}
