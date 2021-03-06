import 'package:seller/src/core/domain/entities/either/left_entity.dart';
import 'package:seller/src/core/domain/entities/either/right_entity.dart';
import 'package:seller/src/core/domain/entities/either/either_entity.dart';

extension FutureEither<L, R> on Future<Either<L, R>> {
  /// Represents the left side of [Either] class which by convention is a "Failure".
  Future<bool> get isLeft => then((either) => either.isLeft);

  /// Represents the right side of [Either] class which by convention is a "Success"
  Future<bool> get isRight => then((either) => either.isRight);

  /// Transform values of [Left] and [Right]
  Future<Either<TL, TR>> either<TL, TR>(
    TL Function(L left) fnL,
    TR Function(R right) fnR,
  ) =>
      then((either) => either.either(fnL, fnR));

  /// Transform value of [Right]
  Future<Either<L, TR>> mapRight<TR>(TR Function(R right) fnR) =>
      then((either) => either.map(fnR));

  /// Transform value of [Left]
  Future<Either<TL, R>> mapLeft<TL>(TL Function(L left) fnL) =>
      then((either) => either.mapLeft(fnL));

  /// Transform value of [Right] when transformation may be finished with an error
  Future<Either<L, TR>> thenRightSync<TR>(
          Either<L, TR> Function(R right) fnR) =>
      then((either) => either.then(fnR));

  /// Transform value of [Left] when transformation may be finished with an [Right]
  Future<Either<TL, R>> thenLeftSync<TL>(Either<TL, R> Function(L left) fnL) =>
      then((either) => either.thenLeft(fnL));

  /// Async transform value of [Right]
  Future<Either<L, TR>> mapRightAsync<TR>(Future<TR> Function(R right) fnR) =>
      then((either) => either.mapAsync(fnR));

  /// Async transform value of [Left]
  Future<Either<TL, R>> mapLeftAsync<TL>(Future<TL> Function(L left) fnL) =>
      then((either) => either.mapLeftAsync(fnL));

  /// Async transform value of [Right] when transformation may be finished with an error
  Future<Either<L, TR>> thenRight<TR>(
          Future<Either<L, TR>> Function(R right) fnR) =>
      then((either) => either.thenAsync(fnR));

  /// Async transform value of [Left] when transformation may be finished with an [Right]
  Future<Either<TL, R>> thenLeft<TL>(
          Future<Either<TL, R>> Function(L left) fnL) =>
      then((either) => either.thenLeftAsync(fnL));

  /// Fold [Left] and [Right] into the value of one type
  Future<T> fold<T>(T Function(L left) fnL, T Function(R right) fnR) =>
      then((either) => either.fold(fnL, fnR));

  /// Swap [Left] and [Right]
  Future<Either<R, L>> swap() =>
      fold<Either<R, L>>((left) => Right(left), (right) => Left(right));
}
