import 'package:bloc_test/bloc_test.dart';

import 'package:seller/src/modules/auth/presentation/screens/auth/signup/bloc/signup_bloc.dart';

class MockSignUpBloc extends MockBloc<SignUpEvent, SignUpState>
    implements SignUpBloc {}
