/// issuccess : true
/// payload : {"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJNU0lTRE4iOiI4NTUxMTIzNDU2NyIsInBhcmVudF9pZCI6Ijg1NTExMjM0NTY3IiwiY29tbW9uX2lkIjoiODU1MTEyMzQ1NjciLCJhcHBsb2dpbiI6dHJ1ZSwibG9naW5fZGF0ZXRpbWUiOiIyMDIyLTAzLTAyVDA5OjIxOjQyLjEzMVoiLCJpYXQiOjE2NDYyMTI5MDJ9.7WPfU-wa2aIvot7oMCLzAOYMrV16_WAHb66PLTTV-9U"}
/// message : "The request has succeeded"

class AppLoginResponse {
  AppLoginResponse({
      bool? issuccess, 
      Payload? payload, 
      String? message,}){
    _issuccess = issuccess;
    _payload = payload;
    _message = message;
}

  AppLoginResponse.fromJson(dynamic json) {
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

/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJNU0lTRE4iOiI4NTUxMTIzNDU2NyIsInBhcmVudF9pZCI6Ijg1NTExMjM0NTY3IiwiY29tbW9uX2lkIjoiODU1MTEyMzQ1NjciLCJhcHBsb2dpbiI6dHJ1ZSwibG9naW5fZGF0ZXRpbWUiOiIyMDIyLTAzLTAyVDA5OjIxOjQyLjEzMVoiLCJpYXQiOjE2NDYyMTI5MDJ9.7WPfU-wa2aIvot7oMCLzAOYMrV16_WAHb66PLTTV-9U"

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