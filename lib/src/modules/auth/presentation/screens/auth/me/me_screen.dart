import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:seller/src/utils/constants/app_constant.dart';

import 'package:seller/src/core/presentation/mixins/state_mixin.dart';

import 'package:seller/src/modules/auth/domain/usecases/me/me_usecase.dart';

import 'package:seller/src/modules/auth/presentation/screens/auth/me/states/me_logic.dart';

class MeScreen extends StatefulWidget {
  static const String path = '/me';

  const MeScreen({Key? key}) : super(key: key);

  @override
  State<MeScreen> createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> with StateMixin {
  @override
  void completeState() {
    Provider.of<MeLogic>(context, listen: false).getMe(
      const MeParams(url: AppContants.urlMe),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _logic = context.read<MeLogic>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Me'),
      ),
      body: ValueListenableBuilder(
        valueListenable: _logic,
        builder: (_, state, __) {
          if (state is MeLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (state is MeFailureState) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is MeSuccessState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('name: ${state.entity.name ?? 'Bed'}'),
                  const SizedBox(height: 12),
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
