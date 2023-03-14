class AgentUpdateBody {
  AgentUpdateBody({
      this.parentmsisdn, 
      this.msisdn, 
      this.walletType,});

  AgentUpdateBody.fromJson(dynamic json) {
    parentmsisdn = json['PARENT_MSISDN'];
    msisdn = json['MSISDN'];
    walletType = json['Wallet_Type'];
  }
  int? parentmsisdn;
  int? msisdn;
  int? walletType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PARENT_MSISDN'] = parentmsisdn;
    map['MSISDN'] = msisdn;
    map['Wallet_Type'] = walletType;
    return map;
  }

}