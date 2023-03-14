/// Msisdn : "85537866093"
/// ResponseCode : 100
/// ResponseDescription : "OTP Code Saved"
/// ResponseDescriptionLocal : null
/// TransactionId : null
/// data : null

class GenerateOtpResponse {
  GenerateOtpResponse({
      String? msisdn, 
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

  GenerateOtpResponse.fromJson(dynamic json) {
    _msisdn = json['Msisdn'];
    _responseCode = json['ResponseCode'];
    _responseDescription = json['ResponseDescription'];
    _responseDescriptionLocal = json['ResponseDescriptionLocal'];
    _transactionId = json['TransactionId'];
    _data = json['data'];
  }
  String? _msisdn;
  int? _responseCode;
  String? _responseDescription;
  dynamic _responseDescriptionLocal;
  dynamic _transactionId;
  dynamic _data;
GenerateOtpResponse copyWith({  String? msisdn,
  int? responseCode,
  String? responseDescription,
  dynamic responseDescriptionLocal,
  dynamic transactionId,
  dynamic data,
}) => GenerateOtpResponse(  msisdn: msisdn ?? _msisdn,
  responseCode: responseCode ?? _responseCode,
  responseDescription: responseDescription ?? _responseDescription,
  responseDescriptionLocal: responseDescriptionLocal ?? _responseDescriptionLocal,
  transactionId: transactionId ?? _transactionId,
  data: data ?? _data,
);
  String? get msisdn => _msisdn;
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