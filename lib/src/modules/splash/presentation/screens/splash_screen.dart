import 'package:lottie/lottie.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:seller/src/utils/debounce/call_debounce.dart';

import 'package:seller/src/modules/auth/presentation/routes/routers.dart';

import 'package:seller/src/modules/splash/presentation/bloc/splash_bloc.dart';

import 'package:seller/src/core/presentation/mixins/state_mixin.dart';
import 'package:seller/src/core/presentation/extensions/widget_extension.dart';

class SplashScreen extends StatefulWidget {
  static const String pathRoot = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with StateMixin {
  late final SplashBloc bloc = widget.locator.get<SplashBloc>();
  final _debounce = CallDebounce(milliseconds: 3000);

  @override
  void onCreated() {
    bloc
      ..add(SplashVerifyConnectivityEvent())
      ..add(SplashVerifyAccessTokenEvent());
  }

  void _navigateTo(String? path) {
    _debounce.run(() {
      Navigator.pushNamedAndRemoveUntil(
        context,
        path!,
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<SplashBloc, SplashState>(
          bloc: bloc,
          listener: (_, SplashState state) {
            if (state is SplashThereIsAccessTokenState) {
              _navigateTo(AuthRoutes.pathMe);
            } else if (state is SplashThereIsNoAccessTokenState) {
              _navigateTo(AuthRoutes.pathSignIn);
            }
          },
          child: BlocBuilder<SplashBloc, SplashState>(
            bloc: bloc,
            builder: (_, SplashState state) {
              if (state is SplashLoadingState) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              if (state is SplashThereIsConnectionState) {
                return Center(
                  child: Lottie.asset(
                    'assets/animations/splash.json',
                    fit: BoxFit.contain,
                  ),
                );
              }

              if (state is SplashThereIsNoConnectionState) {
                return Center(child: Text(state.message));
              }

              return Center(
                child: Lottie.asset(
                  'assets/animations/splash.json',
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
