import 'package:grpc/grpc.dart';

import '../../../flavors.dart';

class GrpcClient {
  ClientChannel? client;
  static final GrpcClient _singleton = new GrpcClient._internal();

  factory GrpcClient() => _singleton;

  GrpcClient._internal() {
    client = ClientChannel(
      F.host, // Your IP here, localhost might not work.
      port: F.port,
      options: ChannelOptions(
        //TODO: Change to secure with server certificates
        credentials: ChannelCredentials.insecure(),
        idleTimeout: Duration(minutes: 1),
      ),
    );
  }
}
