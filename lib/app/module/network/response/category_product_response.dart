import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';
part 'category_product_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class CategoryProductResponse extends BaseResponse {
  @JsonKey(defaultValue: [])
  List<Category>? result;


  CategoryProductResponse({
    String? jsonrpc,
    int? id,
    Error? error,
    this.result,
  }) : super(jsonrpc: jsonrpc, id: id, error: error);

  factory CategoryProductResponse.fromJson(Map<String, dynamic> json) => _$CategoryProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryProductResponseToJson(this);

}


@JsonSerializable()
class Category {
  Category({
    this.id,
    this.name,
    this.parent_id,
    this.child_id,
    this.write_date,});

  int? id;
  String? name;
  dynamic parent_id;
  dynamic child_id;
  String? write_date;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

}


