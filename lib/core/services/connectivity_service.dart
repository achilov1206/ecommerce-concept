import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final _connectivity = Connectivity();
  StreamController<ConnectivityResult>? connectivityStream;
  ConnectivityService() {
    _connectivity.onConnectivityChanged.listen((event) {
      connectivityStream?.add(event);
    });
  }
  Future<void> initConnectivity() async {}
}
