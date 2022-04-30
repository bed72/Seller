import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:seller/src/utils/constants/app_constant.dart';

import 'package:seller/src/modules/http/domain/helpers/http_helper.dart';

import 'package:seller/src/modules/auth/domain/usecases/signup/signup_usecase.dart';
import 'package:seller/src/modules/auth/presentation/screens/auth/me/me_screen.dart';

import 'package:seller/src/modules/auth/presentation/screens/auth/signup/bloc/signup_bloc.dart';

class SignUpScreen extends StatelessWidget {
  static const String path = '/sign_in';

  final params = const SignUpParams(
    password: 'cicada3301',
    email: 'gjramos100@gmail.com',
    url: AppContants.urlAuthSignUp,
    httpMethod: HttpMethod.post,
  );

  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = context.watch<SignupBloc>();

    return Scaffold(
      body: BlocBuilder(
        bloc: _bloc,
        buildWhen: (_, SignUpState state) {
          if (state is SignUpSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              MeScreen.path,
              (Route<dynamic> route) => false,
            );
          }

          return true;
        },
        builder: (BuildContext contex, SignUpState state) {
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

          if (state is SignUpSuccessState) {
            return const Center(
              child: Text('Success'),
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
                    _bloc.add(SignUpAwnerEvent(params));
                  },
                  child: const Text('Enter'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
