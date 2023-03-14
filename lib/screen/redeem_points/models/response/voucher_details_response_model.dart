// To parse this JSON data, do
//
//     final voucherDetailsResponseModel = voucherDetailsResponseModelFromJson(jsonString);

import 'dart:convert';

VoucherDetailsResponseModel voucherDetailsResponseModelFromJson(String str) => VoucherDetailsResponseModel.fromJson(json.decode(str));

String voucherDetailsResponseModelToJson(VoucherDetailsResponseModel data) => json.encode(data.toJson());

class VoucherDetailsResponseModel {
  VoucherDetailsResponseModel({
    this.payload,
    this.message,
  });

  Payload? payload;
  String? message;

  factory VoucherDetailsResponseModel.fromJson(Map<String, dynamic> json) => VoucherDetailsResponseModel(
    payload: Payload.fromJson(json["payload"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "payload": payload!.toJson(),
    "message": message,
  };
}

class Payload {
  Payload({
    this.id,
    this.merchantId,
    this.voucherType,
    this.voucherValue,
    this.productId,
    this.terms,
    this.voucherValidity,
    this.minExpAmount,
    this.expiryDate,
    this.voucherImage,
    this.rewardPoint,
    this.description,
    this.quota,
    this.status,
    this.createdAt,
    this.createdBy,
    this.modifiedAt,
    this.modifiedBy,
    this.approvedAt,
    this.approvedBy,
    this.isOnEdit,
    this.isProductVoucher,
    this.productVoucherMapId,
    this.price,
    this.tier,
    this.merchantName,
  });

  String? id;
  String? merchantId;
  String? voucherType;
  int? voucherValue;
  String? productId;
  String? terms;
  String? voucherValidity;
  int? minExpAmount;
  String? expiryDate;
  String? voucherImage;
  int? rewardPoint;
  String? description;
  int? quota;
  int? status;
  DateTime? createdAt;
  String? createdBy;
  dynamic modifiedAt;
  dynamic modifiedBy;
  DateTime? approvedAt;
  String? approvedBy;
  bool? isOnEdit;
  bool? isProductVoucher;
  String? productVoucherMapId;
  int? price;
  String? tier;
  String? merchantName;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    id: json["Id"],
    merchantId: json["MerchantId"],
    voucherType: json["VoucherType"],
    voucherValue: json["VoucherValue"],
    productId: json["ProductId"],
    terms: json["Terms"],
    voucherValidity: json["VoucherValidity"],
    minExpAmount: json["MinExpAmount"],
    expiryDate: json["ExpiryDate"],
    voucherImage: json["VoucherImage"],
    rewardPoint: json["RewardPoint"],
    description: json["Description"],
    quota: json["Quota"],
    status: json["Status"],
    createdAt: DateTime.parse(json["CreatedAt"]),
    createdBy: json["CreatedBy"],
    modifiedAt: json["ModifiedAt"],
    modifiedBy: json["ModifiedBy"],
    approvedAt: DateTime.parse(json["ApprovedAt"]),
    approvedBy: json["ApprovedBy"],
    isOnEdit: json["IsOnEdit"],
    isProductVoucher: json["is_product_voucher"],
    productVoucherMapId: json["product_voucher_map_id"],
    price: json["price"],
    tier: json["Tier"],
    merchantName: json["MerchantName"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "MerchantId": merchantId,
    "VoucherType": voucherType,
    "VoucherValue": voucherValue,
    "ProductId": productId,
    "Terms": terms,
    "VoucherValidity": voucherValidity,
    "MinExpAmount": minExpAmount,
    "ExpiryDate": expiryDate,
    "VoucherImage": voucherImage,
    "RewardPoint": rewardPoint,
    "Description": description,
    "Quota": quota,
    "Status": status,
    "CreatedAt": createdAt!.toIso8601String(),
    "CreatedBy": createdBy,
    "ModifiedAt": modifiedAt,
    "ModifiedBy": modifiedBy,
    "ApprovedAt": approvedAt!.toIso8601String(),
    "ApprovedBy": approvedBy,
    "IsOnEdit": isOnEdit,
    "is_product_voucher": isProductVoucher,
    "product_voucher_map_id": productVoucherMapId,
    "price": price,
    "Tier": tier,
    "MerchantName": merchantName,
  };
}
