/// Msisdn : "85537866093"
/// ResponseCode : 100
/// ResponseDescription : "Success"
/// ResponseDescriptionLocal : null
/// TransactionId : null
/// data : {"FirstName":"Md","LastName":"Mahfuj","gender":"M","Dob":"2000-03-28"}

class UpdateCustomerValidateOtpResponse {
  UpdateCustomerValidateOtpResponse({
      String? msisdn, 
      int? responseCode, 
      String? responseDescription, 
      dynamic responseDescriptionLocal, 
      dynamic transactionId, 
      Data? data,}){
    _msisdn = msisdn;
    _responseCode = responseCode;
    _responseDescription = responseDescription;
    _responseDescriptionLocal = responseDescriptionLocal;
    _transactionId = transactionId;
    _data = data;
}

  UpdateCustomerValidateOtpResponse.fromJson(dynamic json) {
    _msisdn = json['Msisdn'];
    _responseCode = json['ResponseCode'];
    _responseDescription = json['ResponseDescription'];
    _responseDescriptionLocal = json['ResponseDescriptionLocal'];
    _transactionId = json['TransactionId'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _msisdn;
  int? _responseCode;
  String? _responseDescription;
  dynamic _responseDescriptionLocal;
  dynamic _transactionId;
  Data? _data;

  String? get msisdn => _msisdn;
  int? get responseCode => _responseCode;
  String? get responseDescription => _responseDescription;
  dynamic get responseDescriptionLocal => _responseDescriptionLocal;
  dynamic get transactionId => _transactionId;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Msisdn'] = _msisdn;
    map['ResponseCode'] = _responseCode;
    map['ResponseDescription'] = _responseDescription;
    map['ResponseDescriptionLocal'] = _responseDescriptionLocal;
    map['TransactionId'] = _transactionId;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// FirstName : "Md"
/// LastName : "Mahfuj"
/// gender : "M"
/// Dob : "2000-03-28"

class Data {
  Data({
      String? firstName, 
      String? lastName, 
      String? gender, 
      String? dob,}){
    _firstName = firstName;
    _lastName = lastName;
    _gender = gender;
    _dob = dob;
}

  Data.fromJson(dynamic json) {
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _gender = json['gender'];
    _dob = json['Dob'];
  }
  String? _firstName;
  String? _lastName;
  String? _gender;
  String? _dob;

  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get gender => _gender;
  String? get dob => _dob;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FirstName'] = _firstName;
    map['LastName'] = _lastName;
    map['gender'] = _gender;
    map['Dob'] = _dob;
    return map;
  }

}