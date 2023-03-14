// To parse this JSON data, do
//
//     final membershipIdResponseModel = membershipIdResponseModelFromJson(jsonString);

import 'dart:convert';

MembershipIdResponseModel membershipIdResponseModelFromJson(String str) => MembershipIdResponseModel.fromJson(json.decode(str));

String membershipIdResponseModelToJson(MembershipIdResponseModel data) => json.encode(data.toJson());

class MembershipIdResponseModel {
  MembershipIdResponseModel({
    this.issuccess,
    this.statusCode,
    this.payload,
    this.message,
  });

  bool? issuccess;
  int? statusCode;
  Payload? payload;
  String? message;

  factory MembershipIdResponseModel.fromJson(Map<String, dynamic> json) => MembershipIdResponseModel(
    issuccess: json["issuccess"],
    statusCode: json["statusCode"],
    payload: Payload.fromJson(json["payload"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "issuccess": issuccess,
    "statusCode": statusCode,
    "payload": payload!.toJson(),
    "message": message,
  };
}

class Payload {
  Payload({
    this.currentYearRewardPoint,
    this.lastYearRewardPoint,
    this.pointsOnHold,
    this.expiryDate,
    this.memberType,
    this.pmsmembershipid,
    this.tier,
  });

  String? currentYearRewardPoint;
  dynamic? lastYearRewardPoint;
  dynamic? pointsOnHold;
  dynamic? expiryDate;
  String? memberType;
  String? pmsmembershipid;
  String? tier;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    currentYearRewardPoint: json["CurrentYearRewardPoint"],
    lastYearRewardPoint: json["LastYearRewardPoint"],
    pointsOnHold: json["PointsOnHold"],
    expiryDate: json["ExpiryDate"],
    memberType: json["MemberType"],
    pmsmembershipid: json["pmsmembershipid"],
    tier: json["tier"],
  );

  Map<String, dynamic> toJson() => {
    "CurrentYearRewardPoint": currentYearRewardPoint,
    "LastYearRewardPoint": lastYearRewardPoint,
    "PointsOnHold": pointsOnHold,
    "ExpiryDate": expiryDate,
    "MemberType": memberType,
    "pmsmembershipid": pmsmembershipid,
    "tier": tier,
  };
}
