import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:seller/src/modules/auth/presentation/screens/auth/signup/bloc/signup_bloc.dart';

class MockSignUpBloc extends MockBloc<SignUpEvent, SignUpState>
    implements SignUpBloc {}

void main() {
  group('description', () {
    blocTest<SignUpBloc, SignUpState>(
      'emits [] when nothing is added',
      build: () => SignUpBloc(),
      expect: () => const <int>[],
    );

    /*blocTest<CounterBloc, int>(
      'emits [1] when CounterIncrementPressed is added',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(CounterIncrementPressed()),
      expect: () => const <int>[1],
    );*/
  });
}
