import 'package:flutter/material.dart';

import 'package:seller/src/utils/localization/localization_config.dart';

import 'package:seller/src/core/presentation/routes/routes.dart';
import 'package:seller/src/core/presentation/widgets/provider_widget.dart';
import 'package:seller/src/core/presentation/extensions/context_extension.dart';

import 'package:seller/src/modules/auth/presentation/screens/auth/signup/signup_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      child: MaterialApp(
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
      ),
    );
  }
}
