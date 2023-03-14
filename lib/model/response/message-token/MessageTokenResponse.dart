/// issuccess : true
/// payload : {"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwibG9naW5fZGF0ZXRpbWUiOiIyMDIyLTAzLTE1VDEyOjQ5OjAwLjEzNloiLCJpYXQiOjE2NDczNDg1NDAsImV4cCI6MTY0NzM1MjE0MH0.YfoKax2n5TyB_TIn_G0P7NCJnxc1r6bcfq6amVQ1rh8"}
/// message : "The request has succeeded"



class MessageTokenResponse {
  MessageTokenResponse({
      bool? issuccess, 
      Payload? payload, 
      String? message,}){
    _issuccess = issuccess;
    _payload = payload;
    _message = message;
}

  MessageTokenResponse.fromJson(dynamic json) {
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

/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwibG9naW5fZGF0ZXRpbWUiOiIyMDIyLTAzLTE1VDEyOjQ5OjAwLjEzNloiLCJpYXQiOjE2NDczNDg1NDAsImV4cCI6MTY0NzM1MjE0MH0.YfoKax2n5TyB_TIn_G0P7NCJnxc1r6bcfq6amVQ1rh8"

class Payload {
  Payload({
      String? token,}){
    _token = token;
}

  Payload.fromJson(dynamic json) {
    _token = json['token'];
  }
  String? _token;

  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }

}