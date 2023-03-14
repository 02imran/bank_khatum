/// CustomerMsisdn : "85563214455"
/// Keyword : "REGC"
/// Msisdn : "85537866093"


class GenerateOtpBody {
  GenerateOtpBody({
      String? customerMsisdn, 
      String? keyword, 
      String? msisdn,}){
    _customerMsisdn = customerMsisdn;
    _keyword = keyword;
    _msisdn = msisdn;
}

  GenerateOtpBody.fromJson(dynamic json) {
    _customerMsisdn = json['CustomerMsisdn'];
    _keyword = json['Keyword'];
    _msisdn = json['Msisdn'];
  }
  String? _customerMsisdn;
  String? _keyword;
  String? _msisdn;
GenerateOtpBody copyWith({  String? customerMsisdn,
  String? keyword,
  String? msisdn,
}) => GenerateOtpBody(  customerMsisdn: customerMsisdn ?? _customerMsisdn,
  keyword: keyword ?? _keyword,
  msisdn: msisdn ?? _msisdn,
);
  String? get customerMsisdn => _customerMsisdn;
  String? get keyword => _keyword;
  String? get msisdn => _msisdn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CustomerMsisdn'] = _customerMsisdn;
    map['Keyword'] = _keyword;
    map['Msisdn'] = _msisdn;
    return map;
  }

}