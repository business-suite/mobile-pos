import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';

part 'customers_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class CustomersResponse extends BaseResponse {
  @JsonKey(defaultValue: [])
  List<Customer>? result;


  CustomersResponse({
    String? jsonrpc,
    int? id,
    Error? error,
    this.result,
  }) : super(jsonrpc: jsonrpc, id: id, error: error);

  factory CustomersResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomersResponseToJson(this);

}

class Customer {
  Customer({
    this.id,
    this.name,
    this.street,
    this.city,
    this.stateId,
    this.countryId,
    this.vat,
    this.lang,
    this.phone,
    this.zip,
    this.mobile,
    this.email,
    this.barcode,
    this.writeDate,
    this.propertyAccountPositionId,
    this.propertyProductPricelist,});

  Customer.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    street = json['street'];
    city = json['city'];
    stateId = json['state_id'] != null ? json['state_id'].cast<num>() : [];
    countryId = json['country_id'] != null ? json['country_id'].cast<num>() : [];
    vat = json['vat'];
    lang = json['lang'];
    phone = json['phone'];
    zip = json['zip'];
    mobile = json['mobile'];
    email = json['email'];
    barcode = json['barcode'];
    writeDate = json['write_date'];
    propertyAccountPositionId = json['property_account_position_id'];
    propertyProductPricelist = json['property_product_pricelist'] != null ? json['property_product_pricelist'].cast<num>() : [];
  }
  num? id;
  String? name;
  String? street;
  String? city;
  List<num>? stateId;
  List<num>? countryId;
  bool? vat;
  String? lang;
  String? phone;
  String? zip;
  bool? mobile;
  String? email;
  bool? barcode;
  String? writeDate;
  bool? propertyAccountPositionId;
  List<num>? propertyProductPricelist;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['street'] = street;
    map['city'] = city;
    map['state_id'] = stateId;
    map['country_id'] = countryId;
    map['vat'] = vat;
    map['lang'] = lang;
    map['phone'] = phone;
    map['zip'] = zip;
    map['mobile'] = mobile;
    map['email'] = email;
    map['barcode'] = barcode;
    map['write_date'] = writeDate;
    map['property_account_position_id'] = propertyAccountPositionId;
    map['property_product_pricelist'] = propertyProductPricelist;
    return map;
  }

}
