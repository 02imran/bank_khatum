/// NewPin : "1234"
/// OldPin : "1478"
/// msisdn : "85537866093"



class UpdatePinBody {
  UpdatePinBody({
      String? newPin, 
      String? oldPin, 
      String? msisdn,}){
    _newPin = newPin;
    _oldPin = oldPin;
    _msisdn = msisdn;
}

  UpdatePinBody.fromJson(dynamic json) {
    _newPin = json['NewPin'];
    _oldPin = json['OldPin'];
    _msisdn = json['msisdn'];
  }
  String? _newPin;
  String? _oldPin;
  String? _msisdn;

  String? get newPin => _newPin;
  String? get oldPin => _oldPin;
  String? get msisdn => _msisdn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['NewPin'] = _newPin;
    map['OldPin'] = _oldPin;
    map['msisdn'] = _msisdn;
    return map;
  }

}