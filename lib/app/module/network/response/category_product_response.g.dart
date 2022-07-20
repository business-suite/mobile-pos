// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryProductResponse _$CategoryProductResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryProductResponse(
      jsonrpc: json['jsonrpc'] as String,
      result: (json['result'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CategoryProductResponseToJson(
        CategoryProductResponse instance) =>
    <String, dynamic>{
      'jsonrpc': instance.jsonrpc,
      'result': instance.result,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int?,
      name: json['name'] as String?,
      parent_id: json['parent_id'] as bool?,
      child_id: json['child_id'] as List<dynamic>?,
      write_date: json['write_date'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parent_id': instance.parent_id,
      'child_id': instance.child_id,
      'write_date': instance.write_date,
    };
