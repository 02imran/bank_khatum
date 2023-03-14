// To parse this JSON data, do
//
//     final paymentProcessResponseModel = paymentProcessResponseModelFromJson(jsonString);

import 'dart:convert';

PaymentProcessResponseModel paymentProcessResponseModelFromJson(String str) => PaymentProcessResponseModel.fromJson(json.decode(str));

String paymentProcessResponseModelToJson(PaymentProcessResponseModel data) => json.encode(data.toJson());

class PaymentProcessResponseModel {
  PaymentProcessResponseModel({
    this.responseCode,
    this.responseDescription,
    this.transactionId,
    this.rtValues,
  });

  int? responseCode;
  String? responseDescription;
  String? transactionId;
  String? rtValues;

  factory PaymentProcessResponseModel.fromJson(Map<String, dynamic> json) => PaymentProcessResponseModel(
    responseCode: json["ResponseCode"],
    responseDescription: json["ResponseDescription"],
    transactionId: json["TransactionId"],
    rtValues: json["RtValues"],
  );

  Map<String, dynamic> toJson() => {
    "ResponseCode": responseCode,
    "ResponseDescription": responseDescription,
    "TransactionId": transactionId,
    "RtValues": rtValues,
  };
}
