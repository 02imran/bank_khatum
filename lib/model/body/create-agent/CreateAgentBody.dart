/// MessageBody : "REGA 85578965412 56684441212222 0 md-mahfuj 1478"
/// msisdn : "85537866093"




class CreateAgentBody {
  CreateAgentBody({
      String? messageBody, 
      String? msisdn,}){
    _messageBody = messageBody;
    _msisdn = msisdn;
}

  CreateAgentBody.fromJson(dynamic json) {
    _messageBody = json['MessageBody'];
    _msisdn = json['msisdn'];
  }
  String? _messageBody;
  String? _msisdn;

  String? get messageBody => _messageBody;
  String? get msisdn => _msisdn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['MessageBody'] = _messageBody;
    map['msisdn'] = _msisdn;
    return map;
  }

}