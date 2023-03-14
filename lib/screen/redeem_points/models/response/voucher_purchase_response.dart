

class VoucherPurchaseResponseModel {
  VoucherPurchaseResponseModel({
    this.transactionId,
    this.responseCode,
    this.responseDescription,
    this.voucher,});

  VoucherPurchaseResponseModel.fromJson(dynamic json) {
    transactionId = json['TransactionId'];
    responseCode = json['ResponseCode'];
    responseDescription = json['ResponseDescription'];
    voucher = json['Voucher'] != null ? Voucher.fromJson(json['Voucher']) : null;
  }
  String? transactionId;
  int? responseCode;
  String? responseDescription;
  Voucher? voucher;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TransactionId'] = transactionId;
    map['ResponseCode'] = responseCode;
    map['ResponseDescription'] = responseDescription;
    if (voucher != null) {
      map['Voucher'] = voucher!.toJson();
    }
    return map;
  }

}

class Voucher {
  Voucher({
    this.payload,
    this.message,});

  Voucher.fromJson(dynamic json) {
    payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
    message = json['message'];
  }
  Payload? payload;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (payload != null) {
      map['payload'] = payload!.toJson();
    }
    map['message'] = message;
    return map;
  }

}

class Payload {
  Payload({
    this.voucherPurchaseID,});

  Payload.fromJson(dynamic json) {
    voucherPurchaseID = json['VoucherPurchaseID'];
  }
  String? voucherPurchaseID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['VoucherPurchaseID'] = voucherPurchaseID;
    return map;
  }

}