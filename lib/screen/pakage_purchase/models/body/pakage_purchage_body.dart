// To parse this JSON data, do
//
//     final membershipIdBody = membershipIdBodyFromJson(jsonString);

import 'dart:convert';

MembershipIdBody membershipIdBodyFromJson(String str) => MembershipIdBody.fromJson(json.decode(str));

String membershipIdBodyToJson(MembershipIdBody data) => json.encode(data.toJson());

class MembershipIdBody {
  MembershipIdBody({
    this.subid,
  });

  String? subid;

  factory MembershipIdBody.fromJson(Map<String, dynamic> json) => MembershipIdBody(
    subid: json["subid"],
  );

  Map<String, dynamic> toJson() => {
    "subid": subid,
  };
}
