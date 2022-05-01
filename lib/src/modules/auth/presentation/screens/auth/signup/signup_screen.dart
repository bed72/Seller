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

  void _navigateTo(String path, BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      path,
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _bloc = context.watch<SignupBloc>();

    return Scaffold(
      body: BlocListener<SignupBloc, SignUpState>(
        bloc: _bloc,
        listener: (_, SignUpState state) {
          if (state is SignUpSuccessState) _navigateTo(MeScreen.path, context);
        },
        child: BlocBuilder<SignupBloc, SignUpState>(
          bloc: _bloc,
          builder: (_, SignUpState state) {
            print('\n\n STATE -> [$state] \n\n');
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
                      _bloc.add(SignUpAwnerEvent(params));
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
