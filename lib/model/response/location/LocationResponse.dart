/// Msisdn : null
/// ResponseCode : 100
/// ResponseDescription : "Location Updated Successfully"
/// ResponseDescriptionLocal : null
/// TransactionId : null
/// data : null

class LocationResponse {
  LocationResponse({
      dynamic msisdn, 
      int? responseCode, 
      String? responseDescription, 
      dynamic responseDescriptionLocal, 
      dynamic transactionId, 
      dynamic data,}){
    _msisdn = msisdn;
    _responseCode = responseCode;
    _responseDescription = responseDescription;
    _responseDescriptionLocal = responseDescriptionLocal;
    _transactionId = transactionId;
    _data = data;
}

  LocationResponse.fromJson(dynamic json) {
    _msisdn = json['Msisdn'];
    _responseCode = json['ResponseCode'];
    _responseDescription = json['ResponseDescription'];
    _responseDescriptionLocal = json['ResponseDescriptionLocal'];
    _transactionId = json['TransactionId'];
    _data = json['data'];
  }
  dynamic _msisdn;
  int? _responseCode;
  String? _responseDescription;
  dynamic _responseDescriptionLocal;
  dynamic _transactionId;
  dynamic _data;

  dynamic get msisdn => _msisdn;
  int? get responseCode => _responseCode;
  String? get responseDescription => _responseDescription;
  dynamic get responseDescriptionLocal => _responseDescriptionLocal;
  dynamic get transactionId => _transactionId;
  dynamic get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Msisdn'] = _msisdn;
    map['ResponseCode'] = _responseCode;
    map['ResponseDescription'] = _responseDescription;
    map['ResponseDescriptionLocal'] = _responseDescriptionLocal;
    map['TransactionId'] = _transactionId;
    map['data'] = _data;
    return map;
  }

}