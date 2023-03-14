/// Amount : "10"
/// Currency : "XCD"
/// CustomerMsisdn : ""
/// DestinationMsisdn : "85534292667"
/// Keyword : "MGIV"
/// Msisdn : "85511234567"
/// PIN : "1478"

class AmlBody {
  AmlBody({
      String? amount, 
      String? currency, 
      String? customerMsisdn, 
      String? destinationMsisdn, 
      String? keyword, 
      String? msisdn, 
      String? pin,}){
    _amount = amount;
    _currency = currency;
    _customerMsisdn = customerMsisdn;
    _destinationMsisdn = destinationMsisdn;
    _keyword = keyword;
    _msisdn = msisdn;
    _pin = pin;
}

  AmlBody.fromJson(dynamic json) {
    _amount = json['Amount'];
    _currency = json['Currency'];
    _customerMsisdn = json['CustomerMsisdn'];
    _destinationMsisdn = json['DestinationMsisdn'];
    _keyword = json['Keyword'];
    _msisdn = json['Msisdn'];
    _pin = json['PIN'];
  }
  String? _amount;
  String? _currency;
  String? _customerMsisdn;
  String? _destinationMsisdn;
  String? _keyword;
  String? _msisdn;
  String? _pin;

  String? get amount => _amount;
  String? get currency => _currency;
  String? get customerMsisdn => _customerMsisdn;
  String? get destinationMsisdn => _destinationMsisdn;
  String? get keyword => _keyword;
  String? get msisdn => _msisdn;
  String? get pin => _pin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Amount'] = _amount;
    map['Currency'] = _currency;
    map['CustomerMsisdn'] = _customerMsisdn;
    map['DestinationMsisdn'] = _destinationMsisdn;
    map['Keyword'] = _keyword;
    map['Msisdn'] = _msisdn;
    map['PIN'] = _pin;
    return map;
  }

}