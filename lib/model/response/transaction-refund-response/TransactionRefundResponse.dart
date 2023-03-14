/// issuccess : true
/// payload : {"Code":100,"Msg":"Full Reversal is performed successfully.","RtValues":"SourceMsisdn:85511234567,DestinationMsisdn:85513333444"}
/// message : "Full Reversal is performed successfully."

class TransactionRefundResponse {
  TransactionRefundResponse({
      bool? issuccess, 
      Payload? payload, 
      String? message,}){
    _issuccess = issuccess;
    _payload = payload;
    _message = message;
}

  TransactionRefundResponse.fromJson(dynamic json) {
    _issuccess = json['issuccess'];
    _payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
    _message = json['message'];
  }
  bool? _issuccess;
  Payload? _payload;
  String? _message;

  bool? get issuccess => _issuccess;
  Payload? get payload => _payload;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['issuccess'] = _issuccess;
    if (_payload != null) {
      map['payload'] = _payload?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// Code : 100
/// Msg : "Full Reversal is performed successfully."
/// RtValues : "SourceMsisdn:85511234567,DestinationMsisdn:85513333444"

class Payload {
  Payload({
      int? code, 
      String? msg, 
      String? rtValues,}){
    _code = code;
    _msg = msg;
    _rtValues = rtValues;
}

  Payload.fromJson(dynamic json) {
    _code = json['Code'];
    _msg = json['Msg'];
    _rtValues = json['RtValues'];
  }
  int? _code;
  String? _msg;
  String? _rtValues;

  int? get code => _code;
  String? get msg => _msg;
  String? get rtValues => _rtValues;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Code'] = _code;
    map['Msg'] = _msg;
    map['RtValues'] = _rtValues;
    return map;
  }

}