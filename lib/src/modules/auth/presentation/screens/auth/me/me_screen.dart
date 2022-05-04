import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:seller/src/utils/constants/app_constant.dart';

import 'package:seller/src/core/presentation/mixins/state_mixin.dart';

import 'package:seller/src/modules/http/domain/helpers/http_helper.dart';

import 'package:seller/src/modules/auth/domain/usecases/me/me_usecase.dart';
import 'package:seller/src/modules/auth/presentation/screens/auth/me/bloc/me_bloc.dart';

class MeScreen extends StatefulWidget {
  const MeScreen({Key? key}) : super(key: key);

  @override
  State<MeScreen> createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> with StateMixin {
  @override
  void onCreated() {
    Provider.of<MeBloc>(context, listen: false).add(
      MeGetAwnerEvent(
        const MeParams(
          url: AppContants.urlMe,
          httpMethod: HttpMethod.get,
        ),
      ),
    );
  }

  @override
  void navigateTo(String? path) {}

  @override
  Widget build(BuildContext context) {
    final _bloc = context.watch<MeBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Me'),
      ),
      body: SafeArea(
        child: BlocBuilder<MeBloc, MeState>(
          bloc: _bloc,
          builder: (_, MeState state) {
            print('\n\n STATE -> [$state] \n\n');
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
      ),
    );
  }
}
