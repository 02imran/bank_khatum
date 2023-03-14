/// AppVersion : "1.0.0 17"
/// FullName : "56c3be8c3d073a49"
/// Msisdn : "85511234567"
/// OsVersion : "9"
/// PhoneBrand : "Android"
/// PhoneOs : "Android"
/// TransactionId : "2202151246862"



class SuccessBody {
  SuccessBody({
      String? appVersion, 
      String? fullName, 
      String? msisdn, 
      String? osVersion, 
      String? phoneBrand, 
      String? phoneOs, 
      String? transactionId,}){
    _appVersion = appVersion;
    _fullName = fullName;
    _msisdn = msisdn;
    _osVersion = osVersion;
    _phoneBrand = phoneBrand;
    _phoneOs = phoneOs;
    _transactionId = transactionId;
}

  SuccessBody.fromJson(dynamic json) {
    _appVersion = json['AppVersion'];
    _fullName = json['FullName'];
    _msisdn = json['Msisdn'];
    _osVersion = json['OsVersion'];
    _phoneBrand = json['PhoneBrand'];
    _phoneOs = json['PhoneOs'];
    _transactionId = json['TransactionId'];
  }
  String? _appVersion;
  String? _fullName;
  String? _msisdn;
  String? _osVersion;
  String? _phoneBrand;
  String? _phoneOs;
  String? _transactionId;

  String? get appVersion => _appVersion;
  String? get fullName => _fullName;
  String? get msisdn => _msisdn;
  String? get osVersion => _osVersion;
  String? get phoneBrand => _phoneBrand;
  String? get phoneOs => _phoneOs;
  String? get transactionId => _transactionId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['AppVersion'] = _appVersion;
    map['FullName'] = _fullName;
    map['Msisdn'] = _msisdn;
    map['OsVersion'] = _osVersion;
    map['PhoneBrand'] = _phoneBrand;
    map['PhoneOs'] = _phoneOs;
    map['TransactionId'] = _transactionId;
    return map;
  }

}