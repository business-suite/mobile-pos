import 'package:json_annotation/json_annotation.dart';

import '../../../../flavors.dart';
import 'base_response.dart';

part 'detail_shop_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class DetailShopResponse extends BaseResponse {
  @JsonKey(defaultValue: [])
  List<Product>? result;

  DetailShopResponse({
    required String jsonrpc,
    this.result,
  }) : super(jsonrpc: jsonrpc);

  factory DetailShopResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailShopResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailShopResponseToJson(this);

}

@JsonSerializable()
class Product {
  Product({
    this.id,
    this.display_name,
    this.lst_price,
    this.standard_price,
    this.categ_id,
    this.pos_categ_id,
    this.taxes_id,
    this.barcode,
    this.default_code,
    this.to_weight,
    this.uom_id,
    this.description_sale,
    this.description,
    this.product_tmpl_id,
    this.tracking,
    this.write_date,
    this.available_in_pos,
    this.attribute_line_ids,
    this.active,
    this.invoice_policy,
    this.type,});

  int? id;
  String? display_name;
  double? lst_price;
  double? standard_price;
  List<dynamic>? categ_id;
  dynamic? pos_categ_id;
  List<dynamic>? taxes_id;
  dynamic? barcode;
  dynamic? default_code;
  bool? to_weight;
  List<dynamic>? uom_id;
  dynamic? description_sale;
  dynamic? description;
  List<dynamic>? product_tmpl_id;
  String? tracking;
  String? write_date;
  bool? available_in_pos;
  List<dynamic>? attribute_line_ids;
  bool? active;
  String? invoice_policy;
  String? type;


  String getImageUrl() {
    return '${F
        .baseUrl}/web/image?model=product.product&field=image_256&id=${id}&write_date=${write_date}&unique=1';
  }


  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
