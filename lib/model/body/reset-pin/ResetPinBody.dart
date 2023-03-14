/// Msisdn : "85537866093"
/// NewPin : "1478"
/// Token : "VMxUMhZM+CiToTFkpNR82g=="



class ResetPinBody {
  ResetPinBody({
      String? msisdn, 
      String? newPin, 
      String? token,}){
    _msisdn = msisdn;
    _newPin = newPin;
    _token = token;
}

  ResetPinBody.fromJson(dynamic json) {
    _msisdn = json['Msisdn'];
    _newPin = json['NewPin'];
    _token = json['Token'];
  }
  String? _msisdn;
  String? _newPin;
  String? _token;

  String? get msisdn => _msisdn;
  String? get newPin => _newPin;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Msisdn'] = _msisdn;
    map['NewPin'] = _newPin;
    map['Token'] = _token;
    return map;
  }

}