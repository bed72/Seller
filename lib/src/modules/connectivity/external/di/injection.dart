import 'package:provider/provider.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:seller/src/modules/connectivity/domain/usecases/connectivity_usecase.dart';

import 'package:seller/src/modules/connectivity/external/adapter/connectivity_adapter.dart';

import 'package:seller/src/modules/connectivity/data/clients/connectivity_client.dart';
import 'package:seller/src/modules/connectivity/data/usecases/remote_connectivity_usecase.dart';

final connectivityModule = [
  Provider<Connectivity>.value(
    value: Connectivity(),
  ),
  Provider<ConnectivityClient>(
    create: (context) => ConnectivityAdapter(
      context.read<Connectivity>(),
    ),
  ),
  Provider<ConnectivityUseCase>(
    create: (context) => RemoteConnectivityUseCase(
      context.read<ConnectivityClient>(),
    ),
  ),
];
