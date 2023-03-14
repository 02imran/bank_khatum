/// issuccess : true
/// payload : {"id":1,"merchent_name":"DOWASCO","merchent_number":"17675192862","status":0}
/// message : "The request has succeeded"

class GetDowascoConfigResponse {
  GetDowascoConfigResponse({
      bool? issuccess, 
      Payload? payload, 
      String? message,}){
    _issuccess = issuccess;
    _payload = payload;
    _message = message;
}

  GetDowascoConfigResponse.fromJson(dynamic json) {
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

/// id : 1
/// merchent_name : "DOWASCO"
/// merchent_number : "17675192862"
/// status : 0

class Payload {
  Payload({
      int? id, 
      String? merchentName, 
      String? merchentNumber, 
      int? status,}){
    _id = id;
    _merchentName = merchentName;
    _merchentNumber = merchentNumber;
    _status = status;
}

  Payload.fromJson(dynamic json) {
    _id = json['id'];
    _merchentName = json['merchent_name'];
    _merchentNumber = json['merchent_number'];
    _status = json['status'];
  }
  int? _id;
  String? _merchentName;
  String? _merchentNumber;
  int? _status;

  int? get id => _id;
  String? get merchentName => _merchentName;
  String? get merchentNumber => _merchentNumber;
  int? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['merchent_name'] = _merchentName;
    map['merchent_number'] = _merchentNumber;
    map['status'] = _status;
    return map;
  }

}