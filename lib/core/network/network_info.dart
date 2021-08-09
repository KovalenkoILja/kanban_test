import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

abstract class INetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfo implements INetworkInfo {
  final Connectivity connectivity;

  NetworkInfo({@required this.connectivity});

  @override
  Future<bool> get isConnected async {
    var connectivityResult = await this.connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile)
      return true;
    else if (connectivityResult == ConnectivityResult.wifi)
      return true;
    else
      return false;
  }
}
