import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:seller/src/core/presentation/mixins/state_mixin.dart';
import 'package:seller/src/modules/auth/presentation/screens/auth/signup/signup_screen.dart';

import 'package:seller/src/modules/splash/presentation/states/splash_logic.dart';

class SplashScreen extends StatefulWidget {
  static const String path = '/splash';

  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with StateMixin {
  @override
  void completeState() {
    Provider.of<SplashLogic>(context, listen: false).verifyConnectivity(
      SignUpScreen.path,
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _logic = context.read<SplashLogic>();

    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _logic,
        builder: (context, state, __) {
          if (state is SplashLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (state is SplashSuccessState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (state is SplashFailureState) {
            return Center(child: Text(state.message));
          }

          return const Center(child: Text('Splash'));
        },
      ),
    );
  }
}
