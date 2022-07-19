import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';
part 'category_product_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class CategoryProductResponse extends BaseResponse {
  @JsonKey(defaultValue: [])
  List<Category>? result;

  CategoryProductResponse({
    required String jsonrpc,
    this.result,
  }) : super(jsonrpc: jsonrpc);

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
  bool? parent_id;
  List<dynamic>? child_id;
  String? write_date;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

}


