/// Msisdn : "85537866093"



class VatSettingBody {
  VatSettingBody({
      String? msisdn,}){
    _msisdn = msisdn;
}

  VatSettingBody.fromJson(dynamic json) {
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