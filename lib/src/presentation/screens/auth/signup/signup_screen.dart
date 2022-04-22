import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import 'package:seller/src/domain/helpers/http_helper.dart';
import 'package:seller/src/domain/usecases/signup/signup_usecase.dart';

import 'package:seller/src/presentation/utils/constants/app_constant.dart';
import 'package:seller/src/presentation/screens/auth/user/user_screen.dart';
import 'package:seller/src/presentation/screens/auth/signup/states/signup_logic.dart';

class SignUpScreen extends StatefulWidget {
  static const String path = '/sing_in';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final SignUpLogic _logic = GetIt.instance.get<SignUpLogic>();

  @override
  void dispose() {
    _logic.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _logic,
        builder: (_, state, __) {
          if (state is SignUpLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          /*if (state is SignUpSuccessState) {
            // Navigator.of(context).pushReplacementNamed(UserScreen.path);

            return Center(
              child: Text(state.entity.accessToken),
            );
          }*/

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
                        UserScreen.path, (Route<dynamic> route) => false);
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
