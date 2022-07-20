class BaseResponse {
  String jsonrpc;

  BaseResponse({this.jsonrpc = ''});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
        jsonrpc: json["jsonrpc"]);
  }
}
