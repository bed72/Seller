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
        // ignore: prefer_typing_uninitialized_variables
        late final Widget _widget;
        // ignore: unused_local_variable
        late final _args = settings.arguments;

        switch (settings.name) {
          case pathSignIn:
            _widget = const SignUpScreen();
            break;
          case pathMe:
            _widget = const MeScreen();
            break;
          default:
            _widget = const SignUpScreen();
            break;
        }

        return MaterialPageRoute(builder: (BuildContext context) => _widget);
      },
    );
  }
}
