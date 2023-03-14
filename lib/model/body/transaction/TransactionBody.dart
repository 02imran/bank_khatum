/// AppVersion : "1.0.0 17"
/// FullName : "56c3be8c3d073a49"
/// MessageBody : "MGIV 85534292667 10 1478"
/// OsVersion : "9"
/// PhoneBrand : "Android"
/// PhoneOs : "Android"
/// msisdn : "85511234567"

class TransactionBody {
  TransactionBody({
      String? appVersion, 
      String? fullName, 
      String? messageBody, 
      String? osVersion, 
      String? phoneBrand, 
      String? phoneOs, 
      String? msisdn,}){
    _appVersion = appVersion;
    _fullName = fullName;
    _messageBody = messageBody;
    _osVersion = osVersion;
    _phoneBrand = phoneBrand;
    _phoneOs = phoneOs;
    _msisdn = msisdn;
}

  TransactionBody.fromJson(dynamic json) {
    _appVersion = json['AppVersion'];
    _fullName = json['FullName'];
    _messageBody = json['MessageBody'];
    _osVersion = json['OsVersion'];
    _phoneBrand = json['PhoneBrand'];
    _phoneOs = json['PhoneOs'];
    _msisdn = json['msisdn'];
  }
  String? _appVersion;
  String? _fullName;
  String? _messageBody;
  String? _osVersion;
  String? _phoneBrand;
  String? _phoneOs;
  String? _msisdn;

  String? get appVersion => _appVersion;
  String? get fullName => _fullName;
  String? get messageBody => _messageBody;
  String? get osVersion => _osVersion;
  String? get phoneBrand => _phoneBrand;
  String? get phoneOs => _phoneOs;
  String? get msisdn => _msisdn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['AppVersion'] = _appVersion;
    map['FullName'] = _fullName;
    map['MessageBody'] = _messageBody;
    map['OsVersion'] = _osVersion;
    map['PhoneBrand'] = _phoneBrand;
    map['PhoneOs'] = _phoneOs;
    map['msisdn'] = _msisdn;
    return map;
  }

}