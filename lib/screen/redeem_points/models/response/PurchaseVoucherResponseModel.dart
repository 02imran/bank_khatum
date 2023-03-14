/// payload : {"VoucherPurchaseID":"10000000008826411"}
/// message : "The request has succeeded"

class PurchaseVoucherResponseModel {
  PurchaseVoucherResponseModel({
      Payload? payload, 
      String? message,}){
    _payload = payload;
    _message = message;
}

  PurchaseVoucherResponseModel.fromJson(dynamic json) {
    _payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
    _message = json['message'];
  }
  Payload? _payload;
  String? _message;

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

/// VoucherPurchaseID : "10000000008826411"

class Payload {
  Payload({
      String? voucherPurchaseID,}){
    _voucherPurchaseID = voucherPurchaseID;
}

  Payload.fromJson(dynamic json) {
    _voucherPurchaseID = json['VoucherPurchaseID'];
  }
  String? _voucherPurchaseID;

  String? get voucherPurchaseID => _voucherPurchaseID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['VoucherPurchaseID'] = _voucherPurchaseID;
    return map;
  }

}