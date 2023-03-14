// To parse this JSON data, do
//
//     final pakageList = pakageListFromJson(jsonString);

import 'dart:convert';

PakageList pakageListFromJson(String str) => PakageList.fromJson(json.decode(str));

String pakageListToJson(PakageList data) => json.encode(data.toJson());

class PakageList {
  PakageList({
    this.issuccess,
    this.statusCode,
    this.payload,
    this.message,
  });

  bool? issuccess;
  int? statusCode;
  Payload? payload;
  String? message;

  factory PakageList.fromJson(Map<String, dynamic> json) => PakageList(
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
    // this.billingCycleInfo,
    this.packages,
    this.connection,
  });


  List<Package>? packages;

  List<int>? connection;


  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    packages: List<Package>.from(json["packages"].map((x) => Package.fromJson(x))),
    connection: List<int>.from(json["connection"].map((x) => x)),

  );

  Map<String, dynamic> toJson() => {
    "packages": List<dynamic>.from(packages!.map((x) => x.toJson())),
    "connection": List<dynamic>.from(connection!.map((x) => x)),
  };
}



class Package {
  Package({
    this.id,
    this.billingCycleId,
    this.icon,
    this.packageName,
    this.price,
    this.totalPrice,
    this.status,
    this.effectiveDate,

    this.code,
    this.order,
    this.sd,
    this.hd,
  });

  int? id;
  int? billingCycleId;
  String? icon;
  String? packageName;
  String? price;
  String? totalPrice;
  bool? status;
  DateTime? effectiveDate;
  // CreatedBy? createdBy;
  String? code;
  int? order;
  int? sd;
  int? hd;
  // List<Add>? addons;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    id: json["id"],
    billingCycleId: json["billing_cycle_id"],
    icon: json["icon"],
    packageName: json["package_name"],
    price: json["price"],
    totalPrice: json["total_price"],
    status: json["status"],
    effectiveDate: DateTime.parse(json["effective_date"]),
    // createdBy: createdByValues.map[json["created_by"]],
    code: json["code"],
    order: json["order"],
    sd: json["sd"],
    hd: json["hd"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "billing_cycle_id": billingCycleId,
    "icon": icon,
    "package_name": packageName,
    "price": price,
    "total_price": totalPrice,
    "status": status,
    "effective_date": effectiveDate!.toIso8601String(),
    // "created_by": createdByValues.reverse[createdBy],
    "code": code,
    "order": order,
    "sd": sd,
    "hd": hd,
  };
}

