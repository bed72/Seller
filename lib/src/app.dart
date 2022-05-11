import 'package:flutter/material.dart';

import 'package:seller/src/utils/localization/localization_config.dart';

import 'package:seller/src/core/presentation/routes/routes.dart';
import 'package:seller/src/core/presentation/widgets/provider_widget.dart';
import 'package:seller/src/core/presentation/extensions/context_extension.dart';

import 'package:seller/src/modules/splash/presentation/screens/splash_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      child: MaterialApp(
        restorationScopeId: 'app',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.red,
        ),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        supportedLocales: supportedLocales,
        localizationsDelegates: localizationsDelegates,
        initialRoute: SplashScreen.pathRoot,
        navigatorKey: Navigation.navigatorKey,
        onGenerateRoute: Navigation.onGenerateRoute,
        onGenerateTitle: (BuildContext context) => context.localize.appTitle,
      ),
    );
  }
}
