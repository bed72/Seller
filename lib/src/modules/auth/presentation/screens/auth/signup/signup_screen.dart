import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:seller/src/utils/constants/app_constant.dart';

import 'package:seller/src/modules/http/domain/params/http_params.dart';

import 'package:seller/src/core/presentation/extensions/widget_extension.dart';

import 'package:seller/src/modules/auth/presentation/routes/routers.dart';
import 'package:seller/src/modules/auth/presentation/screens/auth/signup/bloc/signup_bloc.dart';

class SignUpScreen extends StatelessWidget {
  final params = const HttpParams(
    body: {
      'email': 'gjramos100@gmail.com',
      'password': 'cicada3301',
    },
    url: AppContants.urlAuthSignUp,
  );

  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  void _navigateTo(String path, BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      path,
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = locator.get<SignupBloc>();

    return Scaffold(
      body: BlocListener<SignupBloc, SignUpState>(
        bloc: bloc,
        listener: (_, SignUpState state) {
          if (state is SignUpSuccessState) {
            _navigateTo(AuthRoutes.pathMe, context);
          }
        },
        child: BlocBuilder<SignupBloc, SignUpState>(
          bloc: bloc,
          builder: (_, SignUpState state) {
            if (state is SignUpLoadingState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            if (state is SignUpFailureState) {
              return Center(
                child: Text(state.message),
              );
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text('Sign UP'),
                  TextButton(
                    onPressed: () {
                      bloc.add(SignUpAwnerEvent(params));
                    },
                    child: const Text('Enter'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
