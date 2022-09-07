// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomersResponse _$CustomersResponseFromJson(Map<String, dynamic> json) =>
    CustomersResponse(
      jsonrpc: json['jsonrpc'] as String?,
      id: json['id'] as int?,
      error: json['error'] == null ? null : Error.fromJson(json['error']),
      result: (json['result'] as List<dynamic>?)
              ?.map((e) => Customer.fromJson(e))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CustomersResponseToJson(CustomersResponse instance) =>
    <String, dynamic>{
      'jsonrpc': instance.jsonrpc,
      'id': instance.id,
      'error': instance.error,
      'result': instance.result,
    };
