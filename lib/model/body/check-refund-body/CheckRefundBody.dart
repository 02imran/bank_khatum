/// AppVersion : "1.0.0 17"
/// FullName : "56c3be8c3d073a49"
/// Keyword : "FRFD"
/// Msisdn : "85511234567"
/// OsVersion : "9"
/// PhoneBrand : "Android"
/// PhoneOs : "Android"
/// Pin : "1478"
/// TransactionId : "2203020846896"


class CheckRefundBody {
  CheckRefundBody({
      String? appVersion, 
      String? fullName, 
      String? keyword, 
      String? msisdn, 
      String? osVersion, 
      String? phoneBrand, 
      String? phoneOs, 
      String? pin, 
      String? transactionId,}){
    _appVersion = appVersion;
    _fullName = fullName;
    _keyword = keyword;
    _msisdn = msisdn;
    _osVersion = osVersion;
    _phoneBrand = phoneBrand;
    _phoneOs = phoneOs;
    _pin = pin;
    _transactionId = transactionId;
}

  CheckRefundBody.fromJson(dynamic json) {
    _appVersion = json['AppVersion'];
    _fullName = json['FullName'];
    _keyword = json['Keyword'];
    _msisdn = json['Msisdn'];
    _osVersion = json['OsVersion'];
    _phoneBrand = json['PhoneBrand'];
    _phoneOs = json['PhoneOs'];
    _pin = json['Pin'];
    _transactionId = json['TransactionId'];
  }
  String? _appVersion;
  String? _fullName;
  String? _keyword;
  String? _msisdn;
  String? _osVersion;
  String? _phoneBrand;
  String? _phoneOs;
  String? _pin;
  String? _transactionId;

  String? get appVersion => _appVersion;
  String? get fullName => _fullName;
  String? get keyword => _keyword;
  String? get msisdn => _msisdn;
  String? get osVersion => _osVersion;
  String? get phoneBrand => _phoneBrand;
  String? get phoneOs => _phoneOs;
  String? get pin => _pin;
  String? get transactionId => _transactionId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['AppVersion'] = _appVersion;
    map['FullName'] = _fullName;
    map['Keyword'] = _keyword;
    map['Msisdn'] = _msisdn;
    map['OsVersion'] = _osVersion;
    map['PhoneBrand'] = _phoneBrand;
    map['PhoneOs'] = _phoneOs;
    map['Pin'] = _pin;
    map['TransactionId'] = _transactionId;
    return map;
  }

}