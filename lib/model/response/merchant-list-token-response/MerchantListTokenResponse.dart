/// issuccess : true
/// payload : {"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwibG9naW5fZGF0ZXRpbWUiOiIyMDIyLTAzLTA5VDE0OjUxOjU4Ljc1OVoiLCJpYXQiOjE2NDY4Mzc1MTgsImV4cCI6MTY0Njg0MTExOH0.hDGurYjdW-QI8JA17h1UfArwQp1FkEBXE7h3UTBh-VY"}
/// message : "The request has succeeded"


class MerchantListTokenResponse {
  MerchantListTokenResponse({
      bool? issuccess, 
      Payload? payload, 
      String? message,}){
    _issuccess = issuccess;
    _payload = payload;
    _message = message;
}

  MerchantListTokenResponse.fromJson(dynamic json) {
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

/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwibG9naW5fZGF0ZXRpbWUiOiIyMDIyLTAzLTA5VDE0OjUxOjU4Ljc1OVoiLCJpYXQiOjE2NDY4Mzc1MTgsImV4cCI6MTY0Njg0MTExOH0.hDGurYjdW-QI8JA17h1UfArwQp1FkEBXE7h3UTBh-VY"

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