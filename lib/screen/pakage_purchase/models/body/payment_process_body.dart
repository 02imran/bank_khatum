// To parse this JSON data, do
//
//     final paymentProcessBody = paymentProcessBodyFromJson(jsonString);

import 'dart:convert';

PaymentProcessBody paymentProcessBodyFromJson(String str) => PaymentProcessBody.fromJson(json.decode(str));

String paymentProcessBodyToJson(PaymentProcessBody data) => json.encode(data.toJson());

class PaymentProcessBody {
  PaymentProcessBody({
    this.keyword,
    this.sourceWalletId,
    this.destWalletId,
    this.amount,
    this.transactionFee,
    this.transactionComm,
    this.chargePayer,
    this.currency,
    this.referenceId,
    this.comissionReceiver,
  });

  String? keyword;
  String? sourceWalletId;
  String? destWalletId;
  String? amount;
  String? transactionFee;
  String? transactionComm;
  int? chargePayer;
  String? currency;
  String? referenceId;
  int? comissionReceiver;

  factory PaymentProcessBody.fromJson(Map<String, dynamic> json) => PaymentProcessBody(
    keyword: json["Keyword"],
    sourceWalletId: json["Source_Wallet_ID"],
    destWalletId: json["Dest_Wallet_ID"],
    amount: json["Amount"],
    transactionFee: json["Transaction_Fee"],
    transactionComm: json["Transaction_Comm"],
    chargePayer: json["Charge_Payer"],
    currency: json["Currency"],
    referenceId: json["Reference_ID"],
    comissionReceiver: json["Comission_Receiver"],
  );

  Map<String, dynamic> toJson() => {
    "Keyword": keyword,
    "Source_Wallet_ID": sourceWalletId,
    "Dest_Wallet_ID": destWalletId,
    "Amount": amount,
    "Transaction_Fee": transactionFee,
    "Transaction_Comm": transactionComm,
    "Charge_Payer": chargePayer,
    "Currency": currency,
    "Reference_ID": referenceId,
    "Comission_Receiver": comissionReceiver,
  };
}
