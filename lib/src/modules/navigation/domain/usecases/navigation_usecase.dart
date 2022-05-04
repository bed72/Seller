import 'package:flutter/widgets.dart';

abstract class NavigationUseCase {
  void popUntil(RoutePredicate predicate);
  void pop<T extends Object?>([T? result]);
  Future<T?> push<T extends Object?>(Route<T> route);
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
      Route<T> newRoute,
      {TO? result});
  Future<T?> pushAndRemoveUntil<T extends Object?>(
    Route<T> newRoute,
    RoutePredicate predicate,
  );
  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  });
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  });
}
