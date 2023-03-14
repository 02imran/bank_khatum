

class AgentServiceListResponseModel {
  AgentServiceListResponseModel({
      this.issuccess, 
      this.statusCode, 
      this.payload, 
      this.message,});

  AgentServiceListResponseModel.fromJson(dynamic json) {
    issuccess = json['issuccess'];
    statusCode = json['statusCode'];
    if (json['payload'] != null) {
      payload = [];
      json['payload'].forEach((v) {
        payload!.add(AgentServicePayload.fromJson(v));
      });
    }
    message = json['message'];
  }
  bool? issuccess;
  int? statusCode;
  List<AgentServicePayload>? payload;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['issuccess'] = issuccess;
    map['statusCode'] = statusCode;
    if (payload != null) {
      map['payload'] = payload!.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }

}

class AgentServicePayload {
  AgentServicePayload({
    this.msisdn,
    this.accCode,
    this.agentName,
    this.walletType,
    this.parentmsisdn,});

  AgentServicePayload.fromJson(dynamic json) {
    msisdn = json['MSISDN'];
    accCode = json['Acc_Code'];
    agentName = json['Agent_Name'];
    walletType = json['Wallet_Type'];
    parentmsisdn = json['PARENT_MSISDN'];
  }
  String? msisdn;
  String? accCode;
  String? agentName;
  int? walletType;
  String? parentmsisdn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['MSISDN'] = msisdn;
    map['Acc_Code'] = accCode;
    map['Agent_Name'] = agentName;
    map['Wallet_Type'] = walletType;
    map['PARENT_MSISDN'] = parentmsisdn;
    return map;
  }

}