import 'package:flutter/material.dart';

import 'package:seller/src/presentation/routes/routes.dart';

import 'package:seller/src/presentation/screens/auth/signup/signup_screen.dart';

import 'package:seller/src/presentation/utils/extensions/context_extension.dart';
import 'package:seller/src/presentation/utils/localization/localization_config.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      theme: ThemeData(
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
      supportedLocales: supportedLocales,
      localizationsDelegates: localizationsDelegates,
      initialRoute: SignUpScreen.path,
      onGenerateTitle: (BuildContext context) => context.localize.appTitle,
    );
  }
}
