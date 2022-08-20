import 'package:json_annotation/json_annotation.dart';

part 'login_config.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class LoginConfig {
  String? protocol = '';
  String? server = '';
  String? port = '';
  String? database = '';
  String? email = '';
  String? password = '';
  String? userName = '';
  String? avatarUrl = '';

  LoginConfig({
    this.protocol,
    this.server,
    this.port,
    this.database,
    this.email,
    this.password,
    this.userName,
    this.avatarUrl,
  });

  String getBaseUrl() {
    print('$protocol://$server:$port');
    return '$protocol://$server:$port';
  }

  factory LoginConfig.fromJson(Map<String, dynamic> json) =>
      _$LoginConfigFromJson(json);

  Map<String, dynamic> toJson() => _$LoginConfigToJson(this);
}
