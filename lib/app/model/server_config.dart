import 'package:easy_localization/easy_localization.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../generated/locale_keys.g.dart';

part 'server_config.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ServerConfig {
  String? server = '';
  String? port = '';

  ServerConfig({
    this.server,
    this.port,
  });

  String getBaseUrl() {
    return LocaleKeys.http_config.tr(namedArgs: {
      'server':  server ?? '',
      'port': port ?? '',
    });
  }

  factory ServerConfig.fromJson(Map<String, dynamic> json) =>
      _$ServerConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ServerConfigToJson(this);
}
