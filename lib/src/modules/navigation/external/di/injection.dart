import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';

import 'package:seller/src/modules/navigation/domain/usecases/navigation_usecase.dart';

import 'package:seller/src/modules/navigation/external/adapters/navigation_adapter.dart';
import 'package:seller/src/modules/navigation/external/singletons/navigation_singleton.dart';

import 'package:seller/src/modules/navigation/data/clients/navigation_client.dart';
import 'package:seller/src/modules/navigation/data/usecases/remote_navigation_usecase.dart';

final navigationModule = [
  Provider<GlobalKey<NavigatorState>>.value(
    value: NavigationSingleton.instance.navigator,
  ),
  Provider<NavigationClient>(
    create: (context) => NavigationAdapter(
      context.read<GlobalKey<NavigatorState>>(),
    ),
  ),
  Provider<NavigationUseCase>(
    create: (context) => RemoteNavigationUseCase(
      context.read<NavigationClient>(),
    ),
  ),
];
