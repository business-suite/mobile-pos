// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      jsonrpc: json['jsonrpc'] as String,
      is_new_regist: json['is_new_regist'] as bool? ?? false,
      user_id: json['user_id'] as int?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'jsonrpc': instance.jsonrpc,
      'is_new_regist': instance.is_new_regist,
      'user_id': instance.user_id,
    };
