import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:seller/src/modules/connectivity/data/clients/connectivity_client.dart';

class ConnectivityAdapter implements ConnectivityClient {
  late final Connectivity _connectivity;

  ConnectivityAdapter(this._connectivity);

  @override
  Future<bool> call() async {
    if ((await _connectivity.checkConnectivity()) ==
        ConnectivityResult.mobile) {
      return true;
    } else if ((await _connectivity.checkConnectivity()) ==
        ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
