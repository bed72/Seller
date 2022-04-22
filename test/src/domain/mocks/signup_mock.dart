import 'package:mocktail/mocktail.dart';

import 'package:seller/src/domain/helpers/http_helper.dart';
import 'package:seller/src/domain/entities/signup/signup_entity.dart';
import 'package:seller/src/domain/usecases/signup/signup_usecase.dart';

class SignUpSpy extends Mock implements SignUpUseCase {
  When mockSignUpCall() => when(() => call(any()));
  void mockSignUp(SignUpEntity data) =>
      mockSignUpCall().thenAnswer((_) async => data);
  void mockSignUpError(HttpResponse status) =>
      mockSignUpCall().thenThrow(status);
}
