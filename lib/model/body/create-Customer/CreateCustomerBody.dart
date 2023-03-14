/// MessageBody : "REGC 85563214455 Md Mahfuj M 2000-03-28 1478"
/// msisdn : "85537866093"

class CreateCustomerBody {
  CreateCustomerBody({
      String? messageBody, 
      String? msisdn,}){
    _messageBody = messageBody;
    _msisdn = msisdn;
}

  CreateCustomerBody.fromJson(dynamic json) {
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