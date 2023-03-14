/// TransactionId : "2202151246862"
/// ResponseCode : 100
/// ResponseDescription : "Success"
/// Msisdn : null
/// ResponseDescriptionLocal : null
/// data : null

class TransactionResponse {
  TransactionResponse({
      String? transactionId, 
      int? responseCode, 
      String? responseDescription, 
      dynamic msisdn, 
      dynamic responseDescriptionLocal, 
      dynamic data,}){
    _transactionId = transactionId;
    _responseCode = responseCode;
    _responseDescription = responseDescription;
    _msisdn = msisdn;
    _responseDescriptionLocal = responseDescriptionLocal;
    _data = data;
}

  TransactionResponse.fromJson(dynamic json) {
    _transactionId = json['TransactionId'];
    _responseCode = json['ResponseCode'];
    _responseDescription = json['ResponseDescription'];
    _msisdn = json['Msisdn'];
    _responseDescriptionLocal = json['ResponseDescriptionLocal'];
    _data = json['data'];
  }
  String? _transactionId;
  int? _responseCode;
  String? _responseDescription;
  dynamic _msisdn;
  dynamic _responseDescriptionLocal;
  dynamic _data;

  String? get transactionId => _transactionId;
  int? get responseCode => _responseCode;
  String? get responseDescription => _responseDescription;
  dynamic get msisdn => _msisdn;
  dynamic get responseDescriptionLocal => _responseDescriptionLocal;
  dynamic get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TransactionId'] = _transactionId;
    map['ResponseCode'] = _responseCode;
    map['ResponseDescription'] = _responseDescription;
    map['Msisdn'] = _msisdn;
    map['ResponseDescriptionLocal'] = _responseDescriptionLocal;
    map['data'] = _data;
    return map;
  }

}