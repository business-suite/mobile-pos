import 'package:easy_localization/easy_localization.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../generated/locale_keys.g.dart';
import 'base_response.dart';

part 'shops_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ShopsResponse extends BaseResponse {
  @JsonKey(defaultValue: null)
  ShopsResult? result;

  ShopsResponse({
    String? jsonrpc,
    dynamic id,
    Error? error,
    this.result,
  }) : super(jsonrpc: jsonrpc, id: id, error: error);

  factory ShopsResponse.fromJson(Map<String, dynamic> json) =>
      _$ShopsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShopsResponseToJson(this);
}

@JsonSerializable()
class ShopsResult {
  int? length;
  List<Shop>? records;

  ShopsResult({this.length, this.records});

  factory ShopsResult.fromJson(Map<String, dynamic> json) =>
      _$ShopsResultFromJson(json);

  Map<String, dynamic> toJson() => _$ShopsResultToJson(this);
}

class Shop {
  Shop({
    this.id,
    this.currentUserId,
    this.cashControl,
    this.name,
    this.currentSessionId,
    this.currentSessionState,
    this.lastSessionClosingDate,
    this.posSessionUsername,
    this.posSessionState,
    this.posSessionDuration,
    this.currencyId,
    this.numberOfOpenedSession,
    this.lastSessionClosingCash,
  });

  Shop.fromJson(dynamic json) {
    id = json['id'];
    currentUserId = json['current_user_id'];
    cashControl = json['cash_control'];
    name = json['name'];
    currentSessionId = json['current_session_id'];
    currentSessionState = json['current_session_state'];
    lastSessionClosingDate = json['last_session_closing_date'];
    posSessionUsername = json['pos_session_username'];
    posSessionState = json['pos_session_state'];
    posSessionDuration = json['pos_session_duration'];
    currencyId =
        json['currency_id'] != null ? json['currency_id'].cast<dynamic>() : [];
    numberOfOpenedSession = json['number_of_opened_session'];
    lastSessionClosingCash = json['last_session_closing_cash'];
  }

  int? id;
  dynamic? currentUserId;
  dynamic? cashControl;
  String? name;
  dynamic? currentSessionId;
  dynamic? currentSessionState;
  dynamic? lastSessionClosingDate;
  dynamic? posSessionUsername;
  dynamic? posSessionState;
  dynamic? posSessionDuration;
  List<dynamic>? currencyId;
  int? numberOfOpenedSession;
  double? lastSessionClosingCash;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['current_user_id'] = currentUserId;
    map['cash_control'] = cashControl;
    map['name'] = name;
    map['current_session_id'] = currentSessionId;
    map['current_session_state'] = currentSessionState;
    map['last_session_closing_date'] = lastSessionClosingDate;
    map['pos_session_username'] = posSessionUsername;
    map['pos_session_state'] = posSessionState;
    map['pos_session_duration'] = posSessionDuration;
    map['currency_id'] = currencyId;
    map['number_of_opened_session'] = numberOfOpenedSession;
    map['last_session_closing_cash'] = lastSessionClosingCash;
    return map;
  }

  String getCurrentSessionState() {
    switch (currentSessionState) {
      case 'opened':
        return LocaleKeys.continue_selling.tr();
      case 'opening_control':
        return LocaleKeys.open_session_pascal.tr();
      default:
        return LocaleKeys.new_selling.tr();
    }
  }

  String getPosSessionState() {
    switch (posSessionState) {
      case 'opening_control':
        return LocaleKeys.opening_control.tr();
      default:
        return '';
    }
  }
}
