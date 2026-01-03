import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../enums/network_status.dart';

final networkProvider = AsyncNotifierProvider(() => NetworkProvider());

class NetworkProvider extends AsyncNotifier<NetworkStatus> {
  late final Connectivity connectivity;

  @override
  Future<NetworkStatus> build() async {
    connectivity = Connectivity();
    final subscription = connectivity.onConnectivityChanged.listen((_) async {
      state = AsyncData(await checkInternet());
    });

    ref.onDispose(() {
      subscription.cancel();
    });

    return await checkInternet();
  }

  Future<NetworkStatus> checkInternet() async {
    final hasInternet =
        await InternetConnection.createInstance().hasInternetAccess;

    return hasInternet ? NetworkStatus.connected : NetworkStatus.disconnected;
  }
}
