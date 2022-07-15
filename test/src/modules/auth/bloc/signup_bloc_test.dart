import 'package:mocktail/mocktail.dart';

import 'package:bloc_test/bloc_test.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:seller/src/modules/http/domain/params/http_params.dart';

import 'package:seller/src/core/domain/entities/exception/exception.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

import 'package:seller/src/modules/firabase/domain/usecases/crashlytics_usecase.dart';
import 'package:seller/src/modules/firabase/data/usecases/remote_crashlytics_usecase.dart';

import 'package:seller/src/modules/auth/domain/usecases/signup/signup_usecase.dart';
import 'package:seller/src/modules/auth/data/usecases/signup/remote_signup_usecase.dart';
import 'package:seller/src/modules/auth/presentation/screens/auth/signup/bloc/signup_bloc.dart';

import '../mocks/http_params_fake.dart';
import '../mocks/responses/signup_mock_response.dart';
import '../usecases/signup/spy/sign_up_usecase_spy.dart';
import '../usecases/signup/spy/crashlytics_usecase_spy.dart';

void main() {
  late final HttpParams httpParams;
  late final SignUpUseCase signUpUseCase;
  late final CrashlyticsUseCase crashlyticsUseCase;

  late final String resultCrashlytics;
  late final Either<HttpException, Map<String, dynamic>> resultSignUp;

  setUpAll(() {
    httpParams = HttpParamsFake();

    registerFallbackValue(HttpParamsFake());
  });

  group('Should call SignUpBloc with correct values', () {
    setUp(() {
      resultCrashlytics = 'Response mock Crashlytics';
      resultSignUp = SignUpMockResponse.buildJsonSuccess();

      signUpUseCase =
          RemoteSignUpUseCase(SignUpUseCaseSpy()..mockSuccess(resultSignUp));

      crashlyticsUseCase = RemoteCrashlyticsUseCase(
          CrashlyticsUseCaseSpy()..mockRecordErrorSuccess(resultCrashlytics));
    });

    blocTest<SignUpBloc, SignUpState>(
      'Should issue loading event and after success',
      build: () => SignUpBloc(signUpUseCase, crashlyticsUseCase),
      act: (SignUpBloc bloc) => bloc.add(SignUpAwnerEvent(httpParams)),
      expect: () => [
        isA<SignUpLoadingState>(),
        isA<SignUpSuccessState>(),
      ],
    );
  });
}
