
class UpdateCustomerResponse{
  UpdateCustomerResponse({
    int? responseCode,
    List<String>? errorDescription,
    String? responseDescription}){
    _responseCode = responseCode;
    _responseDescription = responseDescription;
    _errorDescription = errorDescription;

  }

  UpdateCustomerResponse.fromJson(dynamic json) {
    _responseCode = json['ResponseCode'];
    _responseDescription = json['ResponseDescription'];
    _errorDescription = json['ErrorDescription'] != null ? json['ErrorDescription'].cast<String>() : [];

  }
  int? _responseCode;
  String? _responseDescription;
  List<String>? _errorDescription;


  int? get responseCode => _responseCode;
  String? get responseDescription => _responseDescription;
  List<String>? get errorDescription => _errorDescription;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ResponseCode'] = _responseCode;
    map['ResponseDescription'] = _responseDescription;
    map['ErrorDescription'] = _errorDescription;

    return map;
  }

}
