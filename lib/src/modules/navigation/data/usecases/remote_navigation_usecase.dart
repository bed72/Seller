import 'package:flutter/widgets.dart';

import 'package:seller/src/modules/navigation/data/clients/navigation_client.dart';

import 'package:seller/src/modules/navigation/domain/usecases/navigation_usecase.dart';

class RemoteNavigationUseCase implements NavigationUseCase {
  late final NavigationClient _navigationClient;

  RemoteNavigationUseCase(this._navigationClient);

  @override
  void pop<T extends Object?>([T? result]) {
    _navigationClient.pop<T>(result);
  }

  @override
  void popUntil(RoutePredicate predicate) {
    _navigationClient.popUntil(predicate);
  }

  @override
  Future<T?> push<T extends Object?>(Route<T> route) async =>
      await _navigationClient.push<T>(route);

  @override
  Future<T?> pushAndRemoveUntil<T extends Object?>(
    Route<T> newRoute,
    RoutePredicate predicate,
  ) async =>
      await _navigationClient.pushAndRemoveUntil<T>(newRoute, predicate);

  @override
  Future<T?> pushNamed<T extends Object?>(String routeName,
          {Object? arguments}) async =>
      await _navigationClient.pushNamed<T>(
        routeName,
        arguments: arguments,
      );

  @override
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
          Route<T> newRoute,
          {TO? result}) async =>
      await _navigationClient.pushReplacement<T, TO>(
        newRoute,
        result: result,
      );

  @override
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
          String routeName,
          {TO? result,
          Object? arguments}) async =>
      await _navigationClient.pushReplacementNamed<T, TO>(
        routeName,
        result: result,
      );
}
