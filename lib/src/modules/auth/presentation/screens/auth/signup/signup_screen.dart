import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:seller/src/utils/constants/app_constant.dart';

import 'package:seller/src/modules/http/domain/helpers/http_helper.dart';

import 'package:seller/src/modules/auth/domain/usecases/signup/signup_usecase.dart';

import 'package:seller/src/modules/auth/presentation/screens/auth/me/me_screen.dart';
import 'package:seller/src/modules/auth/presentation/screens/auth/signup/states/signup_logic.dart';

class SignUpScreen extends StatelessWidget {
  static const String path = '/sign_in';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _logic = context.read<SignUpLogic>();

    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _logic,
        builder: (_, state, __) {
          if (state is SignUpLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text('Sign UP'),
                TextButton(
                  onPressed: () async {
                    await _logic.signUp(
                      const SignUpParams(
                        password: 'cicada3301',
                        email: 'gjramos100@gmail.com',
                        url: AppContants.urlAuthSignUp,
                        httpMethod: HttpMethod.post,
                      ),
                    );

                    Navigator.of(context).pushNamedAndRemoveUntil(
                      MeScreen.path,
                      (Route<dynamic> route) => false,
                    );
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
