import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import 'package:seller/src/domain/usecases/user/user_usecase.dart';

import 'package:seller/src/presentation/mixins/state_mixin.dart';

import 'package:seller/src/presentation/screens/auth/user/states/user_logic.dart';
import 'package:seller/src/presentation/utils/constants/app_constant.dart';

class UserScreen extends StatefulWidget {
  static const String path = '/user';

  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> with StateMixin {
  final UserLogic _logic = GetIt.instance.get<UserLogic>();

  @override
  void setupState() {
    _logic.getUser(const UserParams(url: AppContants.urlUser));
  }

  @override
  void destroyState() {
    _logic.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: ValueListenableBuilder(
        valueListenable: _logic,
        builder: (_, state, __) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (state is UserFailureState) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is UserSuccessState) {
            return Center(
              child: Column(
                children: <Widget>[
                  Text('name: ${state.entity.name}'),
                  Text('email: ${state.entity.email}'),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
