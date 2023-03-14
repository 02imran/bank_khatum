import 'dart:convert';
/// payload : {"CustomerId":"600008817670814133","PointAwarded":600,"PMNTTransactionId":"23031413551"}
/// message : "The request has succeeded"

UserDiscountVoucherResponse userDiscountVoucherResponseFromJson(String str) => UserDiscountVoucherResponse.fromJson(json.decode(str));
String userDiscountVoucherResponseToJson(UserDiscountVoucherResponse data) => json.encode(data.toJson());
class UserDiscountVoucherResponse {
  UserDiscountVoucherResponse({
      Payload? payload, 
      String? message,}){
    _payload = payload;
    _message = message;
}

  UserDiscountVoucherResponse.fromJson(dynamic json) {
    _payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
    _message = json['message'];
  }
  Payload? _payload;
  String? _message;
UserDiscountVoucherResponse copyWith({  Payload? payload,
  String? message,
}) => UserDiscountVoucherResponse(  payload: payload ?? _payload,
  message: message ?? _message,
);
  Payload? get payload => _payload;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_payload != null) {
      map['payload'] = _payload?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// CustomerId : "600008817670814133"
/// PointAwarded : 600
/// PMNTTransactionId : "23031413551"

Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));
String payloadToJson(Payload data) => json.encode(data.toJson());
class Payload {
  Payload({
      String? customerId, 
      num? pointAwarded, 
      String? pMNTTransactionId,}){
    _customerId = customerId;
    _pointAwarded = pointAwarded;
    _pMNTTransactionId = pMNTTransactionId;
}

  Payload.fromJson(dynamic json) {
    _customerId = json['CustomerId'];
    _pointAwarded = json['PointAwarded'];
    _pMNTTransactionId = json['PMNTTransactionId'];
  }
  String? _customerId;
  num? _pointAwarded;
  String? _pMNTTransactionId;
Payload copyWith({  String? customerId,
  num? pointAwarded,
  String? pMNTTransactionId,
}) => Payload(  customerId: customerId ?? _customerId,
  pointAwarded: pointAwarded ?? _pointAwarded,
  pMNTTransactionId: pMNTTransactionId ?? _pMNTTransactionId,
);
  String? get customerId => _customerId;
  num? get pointAwarded => _pointAwarded;
  String? get pMNTTransactionId => _pMNTTransactionId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CustomerId'] = _customerId;
    map['PointAwarded'] = _pointAwarded;
    map['PMNTTransactionId'] = _pMNTTransactionId;
    return map;
  }

}