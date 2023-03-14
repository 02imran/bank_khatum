import 'dart:convert';
/// voucherid : "PD00203"
/// voucherpurchaseid : "120374"
/// pin : "1234"

UserDiscountVoucherBody userDiscountVoucherBodyFromJson(String str) => UserDiscountVoucherBody.fromJson(json.decode(str));
String userDiscountVoucherBodyToJson(UserDiscountVoucherBody data) => json.encode(data.toJson());
class UserDiscountVoucherBody {
  UserDiscountVoucherBody({
      String? voucherid, 
      String? voucherpurchaseid, 
      String? pin,}){
    _voucherid = voucherid;
    _voucherpurchaseid = voucherpurchaseid;
    _pin = pin;
}

  UserDiscountVoucherBody.fromJson(dynamic json) {
    _voucherid = json['voucherid'];
    _voucherpurchaseid = json['voucherpurchaseid'];
    _pin = json['pin'];
  }
  String? _voucherid;
  String? _voucherpurchaseid;
  String? _pin;
UserDiscountVoucherBody copyWith({  String? voucherid,
  String? voucherpurchaseid,
  String? pin,
}) => UserDiscountVoucherBody(  voucherid: voucherid ?? _voucherid,
  voucherpurchaseid: voucherpurchaseid ?? _voucherpurchaseid,
  pin: pin ?? _pin,
);
  String? get voucherid => _voucherid;
  String? get voucherpurchaseid => _voucherpurchaseid;
  String? get pin => _pin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['voucherid'] = _voucherid;
    map['voucherpurchaseid'] = _voucherpurchaseid;
    map['pin'] = _pin;
    return map;
  }

}