
import '../generated/hello.pb.dart';
import '../generated/hello.pbgrpc.dart';
import '../grpc_module.dart';

class HelloService {
  static Future<AlbumResponse> SayHello() async{
    var client = AlbumServiceClient(GrpcClient().client!);
    return await client.getAlbums(AlbumRequest());
  }
}