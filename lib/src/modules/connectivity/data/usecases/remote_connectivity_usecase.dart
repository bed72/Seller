import 'package:seller/src/modules/connectivity/data/clients/connectivity_client.dart';

import 'package:seller/src/modules/connectivity/domain/usecases/connectivity_usecase.dart';

class RemoteConnectivityUseCase implements ConnectivityUseCase {
  late final ConnectivityClient _connectivityClient;

  RemoteConnectivityUseCase(this._connectivityClient);

  @override
  Future<bool> call() async {
    return await _connectivityClient();
  }
}
