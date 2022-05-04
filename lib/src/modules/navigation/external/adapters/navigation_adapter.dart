import 'package:flutter/widgets.dart';

import 'package:seller/src/modules/navigation/data/clients/navigation_client.dart';

class NavigationAdapter implements NavigationClient {
  late final GlobalKey<NavigatorState> _navigator;

  NavigationAdapter(this._navigator);

  @override
  void pop<T extends Object?>([T? result]) {
    _navigator.currentState!.pop<T>(result);
  }

  @override
  void popUntil(RoutePredicate predicate) {
    _navigator.currentState!.popUntil(predicate);
  }

  @override
  Future<T?> pushNamed<T extends Object?>(String routeName,
          {Object? arguments}) async =>
      await _navigator.currentState!.pushNamed<T>(
        routeName,
        arguments: arguments,
      );

  @override
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
          String routeName,
          {TO? result,
          Object? arguments}) async =>
      await _navigator.currentState!.pushReplacementNamed<T, TO>(
        routeName,
        result: result,
        arguments: arguments,
      );

  @override
  Future<T?> push<T extends Object?>(Route<T> route) async =>
      await _navigator.currentState!.push<T>(route);

  @override
  Future<T?> pushAndRemoveUntil<T extends Object?>(
    Route<T> newRoute,
    RoutePredicate predicate,
  ) async =>
      await _navigator.currentState!.pushAndRemoveUntil<T>(
        newRoute,
        predicate,
      );

  @override
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
          Route<T> newRoute,
          {TO? result}) async =>
      await _navigator.currentState!.pushReplacement<T, TO>(
        newRoute,
        result: result,
      );
}
