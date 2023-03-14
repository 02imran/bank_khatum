/// CustomerMsisdn : "85563214455"
/// Msisdn : "85537866093"
/// PlainOtp : "188554"

class ValidateOtpCustomerBody {
  ValidateOtpCustomerBody({
      String? customerMsisdn, 
      String? msisdn, 
      String? plainOtp,}){
    _customerMsisdn = customerMsisdn;
    _msisdn = msisdn;
    _plainOtp = plainOtp;
}

  ValidateOtpCustomerBody.fromJson(dynamic json) {
    _customerMsisdn = json['CustomerMsisdn'];
    _msisdn = json['Msisdn'];
    _plainOtp = json['PlainOtp'];
  }
  String? _customerMsisdn;
  String? _msisdn;
  String? _plainOtp;
ValidateOtpCustomerBody copyWith({  String? customerMsisdn,
  String? msisdn,
  String? plainOtp,
}) => ValidateOtpCustomerBody(  customerMsisdn: customerMsisdn ?? _customerMsisdn,
  msisdn: msisdn ?? _msisdn,
  plainOtp: plainOtp ?? _plainOtp,
);
  String? get customerMsisdn => _customerMsisdn;
  String? get msisdn => _msisdn;
  String? get plainOtp => _plainOtp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CustomerMsisdn'] = _customerMsisdn;
    map['Msisdn'] = _msisdn;
    map['PlainOtp'] = _plainOtp;
    return map;
  }

}