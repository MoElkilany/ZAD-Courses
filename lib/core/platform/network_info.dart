import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod/riverpod.dart';

import '../../di/external_services.dart';

abstract class NetworkInfo {
  bool get isConnected;
}

final networkInfo = Provider<NetworkInfo>(
  (ref) => NetworkInfoImpl(
    ref.read<Connectivity>(ExternalServices.connectivity),
    ref.read<InternetConnectionChecker>(
      ExternalServices.internectConnectionChecker,
    ),
  ),
);

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;
  final InternetConnectionChecker internetConnectionChecker;

  late final StreamSubscription<List<ConnectivityResult>> subscription;

  bool _isDeviceConnected = false;

  NetworkInfoImpl(this.connectivity, this.internetConnectionChecker) {
    subscription = Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> result) async {
        if (result.last != ConnectivityResult.none) {
          _isDeviceConnected = await InternetConnectionChecker().hasConnection;
        }
      },
    );
  }

  @override
  bool get isConnected {
    try {
      return true; // _isDeviceConnected;
    } catch (e) {
      return false;
    }
  }
}
