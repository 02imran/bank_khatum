/// Msisdn : "85512228887"
/// FullName : "05b96b9793596426"
/// AppVersion : "1.0.0 31"
/// PhoneBrand : "RMX1801"
/// PhoneOs : "Android"
/// OsVersion : "Q"
/// DeviceId : "eJed_aawQRuuHcnKXB8-mR:APA91bHP1RQfR5CO32q8DT0XU0kpshCW2Zs_AyF7uOf_lMdJjonV0Z-kxy5Mn2vNkiAXfUQI2Y_KdtNCThdWr3F_TUSO1pZ8DoLawYPbu3Aj2pWNRy0jg5rLOyJMbZK21wUgtTXkqQAw"




class GetCustomerMenuBody {
  GetCustomerMenuBody({
      String? msisdn, 
      String? fullName, 
      String? appVersion, 
      String? phoneBrand, 
      String? phoneOs, 
      String? osVersion, 
      String? deviceId,}){
    _msisdn = msisdn;
    _fullName = fullName;
    _appVersion = appVersion;
    _phoneBrand = phoneBrand;
    _phoneOs = phoneOs;
    _osVersion = osVersion;
    _deviceId = deviceId;
}

  GetCustomerMenuBody.fromJson(dynamic json) {
    _msisdn = json['Msisdn'];
    _fullName = json['FullName'];
    _appVersion = json['AppVersion'];
    _phoneBrand = json['PhoneBrand'];
    _phoneOs = json['PhoneOs'];
    _osVersion = json['OsVersion'];
    _deviceId = json['DeviceId'];
  }
  String? _msisdn;
  String? _fullName;
  String? _appVersion;
  String? _phoneBrand;
  String? _phoneOs;
  String? _osVersion;
  String? _deviceId;

  String? get msisdn => _msisdn;
  String? get fullName => _fullName;
  String? get appVersion => _appVersion;
  String? get phoneBrand => _phoneBrand;
  String? get phoneOs => _phoneOs;
  String? get osVersion => _osVersion;
  String? get deviceId => _deviceId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Msisdn'] = _msisdn;
    map['FullName'] = _fullName;
    map['AppVersion'] = _appVersion;
    map['PhoneBrand'] = _phoneBrand;
    map['PhoneOs'] = _phoneOs;
    map['OsVersion'] = _osVersion;
    map['DeviceId'] = _deviceId;
    return map;
  }

}