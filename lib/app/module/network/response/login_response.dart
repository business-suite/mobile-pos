import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';
part 'login_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class LoginResponse extends BaseResponse {
  bool is_new_regist = false;
  int? user_id;

  LoginResponse({
    required String jsonrpc,
    this.is_new_regist = false,
    this.user_id,
  }) : super(jsonrpc: jsonrpc);

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

}
