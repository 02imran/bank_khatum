class AgentServiceListBody {
  AgentServiceListBody({
      this.msisdn, 
      this.walletId,});

  AgentServiceListBody.fromJson(dynamic json) {
    msisdn = json['msisdn'];
    walletId = json['wallet_id'];
  }
  int? msisdn;
  int? walletId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msisdn'] = msisdn;
    map['wallet_id'] = walletId;
    return map;
  }

}