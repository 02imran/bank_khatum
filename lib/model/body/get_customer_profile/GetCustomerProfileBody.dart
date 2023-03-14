/// CustomerMsisdn : "85563214455"
/// Msisdn : "85537866093"

class GetCustomerProfileBody {
  GetCustomerProfileBody({
      String? customerMsisdn, 
      String? msisdn,}){
    _customerMsisdn = customerMsisdn;
    _msisdn = msisdn;
}

  GetCustomerProfileBody.fromJson(dynamic json) {
    _customerMsisdn = json['CustomerMsisdn'];
    _msisdn = json['Msisdn'];
  }
  String? _customerMsisdn;
  String? _msisdn;

  String? get customerMsisdn => _customerMsisdn;
  String? get msisdn => _msisdn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CustomerMsisdn'] = _customerMsisdn;
    map['Msisdn'] = _msisdn;
    return map;
  }

}