/// Device_Id : "dmKQi4HJSa8:APA91bGxR1-5CeJrduNSHmJqBtbbHyQwXBpfaUewKCVLHO0tfz0qlCw_rA0CP2WGi-rfRS9ESsuKf9Edh-JLF2Rdt3HsB_vQfYi1w_l6ejB11WFdmCS5eQPmJwEJsvOCG6tAnLLvMYJV"
/// MSISDN : "85511234567"
/// Phone_Brand : "Android"
/// Phone_Os : "Android"


class AppLoginBody {
  AppLoginBody({
      String? deviceId, 
      String? msisdn, 
      String? phoneBrand, 
      String? phoneOs,}){
    _deviceId = deviceId;
    _msisdn = msisdn;
    _phoneBrand = phoneBrand;
    _phoneOs = phoneOs;
}

  AppLoginBody.fromJson(dynamic json) {
    _deviceId = json['Device_Id'];
    _msisdn = json['MSISDN'];
    _phoneBrand = json['Phone_Brand'];
    _phoneOs = json['Phone_Os'];
  }
  String? _deviceId;
  String? _msisdn;
  String? _phoneBrand;
  String? _phoneOs;

  String? get deviceId => _deviceId;
  String? get msisdn => _msisdn;
  String? get phoneBrand => _phoneBrand;
  String? get phoneOs => _phoneOs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Device_Id'] = _deviceId;
    map['MSISDN'] = _msisdn;
    map['Phone_Brand'] = _phoneBrand;
    map['Phone_Os'] = _phoneOs;
    return map;
  }

}