import 'package:flutter_test/flutter_test.dart';
import 'package:seller/src/core/domain/entities/either/left_entity.dart';
import 'package:seller/src/core/domain/entities/either/right_entity.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

void main() {
  group('Should test de Either class', () {
    test('Should right generic is right', () {
      const value = Right<String, bool>(true);

      expect(value.isRight, true);
      expect(value.isLeft, false);
      expect(() => value.left, throwsA(isException));
      expect(value.right, true);
    });

    test('Shoul left generic is left', () {
      const value = Left<String, bool>('true');

      expect(value.isLeft, true);
      expect(value.isRight, false);
      expect(() => value.right, throwsA(isException));
      expect(value.left, 'true');
    });

    test('Should map right', () {
      const value = Right<String, bool>(true);

      value.either(
          (left) => expect(false, true), (right) => expect(right, true));
      value.map((right) => false).either(
          (left) => expect(false, true), (right) => expect(right, false));
      value.either(
          (left) => expect(false, true), (right) => expect(right, true));
    });

    test('Should map left', () {
      const value = Left<bool, String>(true);

      value.either(
          (left) => expect(left, true), (right) => expect(false, true));
      value
          .map((right) => false)
          .either((left) => expect(left, true), (right) => expect(true, false));
    });

    test('Should mapLeft right', () {
      const value = Right<String, bool>(true);

      value.mapLeft((left) => false).either(
          (left) => expect(false, true), (right) => expect(right, true));
    });

    test('Should mapLeft left', () {
      const value = Left<bool, String>(true);

      value.mapLeft((left) => false).either(
          (left) => expect(left, false), (right) => expect(true, false));
    });

    test('Test the fold', () {
      expect(
          const Left<String, String>('')
              .fold<bool>((left) => true, (right) => false),
          true);
      expect(
          const Right<String, String>('')
              .fold<bool>((left) => true, (right) => false),
          false);
    });

    test('Test the cond', () {
      expect(Either.cond(true, 'left', 'right').isRight, true);
      expect(Either.cond(false, 'left', 'right').isLeft, true);
      expect(
          Either.condLazy(
              true, () => throw Exception('not lazy'), () => 'right').isRight,
          true);
      expect(
          Either.condLazy(
              false, () => 'left', () => throw Exception('not lazy')).isLeft,
          true);
    });

    test('Test the swap', () {
      final value = const Right<String, bool>(true).swap();

      expect(value.isRight, false);
      expect(value.isLeft, true);

      final _value = const Left<bool, String>(true).swap();
      expect(_value.isRight, true);
      expect(_value.isLeft, false);

      final __value = value.swap();
      expect(__value.isRight, true);
      expect(__value.isLeft, false);
    });

    test('Test the tryCatch', () {
      expect(
          Either.tryCatch<bool, String, Exception>(
              (_) => true, () => throw Exception('not right')).isLeft,
          true);
      expect(
          Either.tryCatch<bool, String, Exception>((_) => false, () => 'right')
              .isRight,
          true);
    });
  });
}
