import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfoType {
  Future<bool> get isConnected;
}

class NetworkInfo implements NetworkInfoType {
  final DataConnectionChecker connectionChecker;

  NetworkInfo(this.connectionChecker);
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
