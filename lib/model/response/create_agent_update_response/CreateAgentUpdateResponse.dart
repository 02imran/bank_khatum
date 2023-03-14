/// issuccess : true
/// payload : null
/// message : "The request has succeeded"

class CreateAgentUpdateResponse {
  CreateAgentUpdateResponse({
      bool? issuccess, 
      dynamic payload, 
      String? message,}){
    _issuccess = issuccess;
    _payload = payload;
    _message = message;
}

  CreateAgentUpdateResponse.fromJson(dynamic json) {
    _issuccess = json['issuccess'];
    _payload = json['payload'];
    _message = json['message'];
  }
  bool? _issuccess;
  dynamic _payload;
  String? _message;
CreateAgentUpdateResponse copyWith({  bool? issuccess,
  dynamic payload,
  String? message,
}) => CreateAgentUpdateResponse(  issuccess: issuccess ?? _issuccess,
  payload: payload ?? _payload,
  message: message ?? _message,
);
  bool? get issuccess => _issuccess;
  dynamic get payload => _payload;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['issuccess'] = _issuccess;
    map['payload'] = _payload;
    map['message'] = _message;
    return map;
  }

}