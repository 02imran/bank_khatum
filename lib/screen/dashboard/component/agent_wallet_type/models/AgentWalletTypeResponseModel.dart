// To parse this JSON data, do
//
//     final agentWalletTypeResponseModel = agentWalletTypeResponseModelFromJson(jsonString);

import 'dart:convert';

AgentWalletTypeResponseModel agentWalletTypeResponseModelFromJson(String str) => AgentWalletTypeResponseModel.fromJson(json.decode(str));

String agentWalletTypeResponseModelToJson(AgentWalletTypeResponseModel data) => json.encode(data.toJson());

class AgentWalletTypeResponseModel {
  AgentWalletTypeResponseModel({
    this.issuccess,
    this.statusCode,
    this.payload,
    this.message,
  });

  bool? issuccess;
  int? statusCode;
  List<WalletTypePayload>? payload;
  String? message;

  factory AgentWalletTypeResponseModel.fromJson(Map<String, dynamic> json) => AgentWalletTypeResponseModel(
    issuccess: json["issuccess"],
    statusCode: json["statusCode"],
    payload: List<WalletTypePayload>.from(json["payload"].map((x) => WalletTypePayload.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "issuccess": issuccess,
    "statusCode": statusCode,
    "payload": List<dynamic>.from(payload!.map((x) => x.toJson())),
    "message": message,
  };
}

class WalletTypePayload {
  WalletTypePayload({
    this.walletId,
    this.walletName,
    this.hierarchy,
  });

  int? walletId;
  String? walletName;
  int? hierarchy;

  factory WalletTypePayload.fromJson(Map<String, dynamic> json) => WalletTypePayload(
    walletId: json["Wallet_ID"],
    walletName: json["Wallet_Name"],
    hierarchy: json["Hierarchy"],
  );

  Map<String, dynamic> toJson() => {
    "Wallet_ID": walletId,
    "Wallet_Name": walletName,
    "Hierarchy": hierarchy,
  };
}
