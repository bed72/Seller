import 'package:flutter/widgets.dart';

class NavigationSingleton {
  late final GlobalKey<NavigatorState> _navigator;

  NavigationSingleton._();

  static final NavigationSingleton _instance = NavigationSingleton._();
  static NavigationSingleton get instance => _instance;

  factory NavigationSingleton() => _instance;

  void initialized() {
    _navigator = GlobalKey<NavigatorState>();
  }

  GlobalKey<NavigatorState> get navigator => _navigator;
}
