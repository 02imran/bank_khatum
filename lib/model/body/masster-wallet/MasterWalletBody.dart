/// Msisdn : "85537866093"


class MasterWalletBody {
  MasterWalletBody({
      String? msisdn,}){
    _msisdn = msisdn;
}

  MasterWalletBody.fromJson(dynamic json) {
    _msisdn = json['Msisdn'];
  }
  String? _msisdn;

  String? get msisdn => _msisdn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Msisdn'] = _msisdn;
    return map;
  }

}