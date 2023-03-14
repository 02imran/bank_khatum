/// issuccess : true
/// payload : {"AccountNumber":"0104059501","BillingAddress":"40 King George V St|Roseau|||","CustomerFirstName":null,"CustomerLastName":"Dominica Co-operative Societies League","CustomerPhoneNumber":"7674484051","LastBillDueDate":"2022-03-21T00:00:00","LastPaymentAmount":"5.00","LastPaymentDate":"2022-01-04T00:00:00","OverdueBalance":"28.14","PendingPaymentAmount":["_text"],"LastBillAmount":"112.70","TotalBalance":"112.70"}
/// message : "The request has succeeded"

class GetAccountDetailsResponse {
  GetAccountDetailsResponse({
      bool? issuccess, 
      Payload? payload, 
      String? message,}){
    _issuccess = issuccess;
    _payload = payload;
    _message = message;
}

  GetAccountDetailsResponse.fromJson(dynamic json) {
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

/// AccountNumber : "0104059501"
/// BillingAddress : "40 King George V St|Roseau|||"
/// CustomerFirstName : null
/// CustomerLastName : "Dominica Co-operative Societies League"
/// CustomerPhoneNumber : "7674484051"
/// LastBillDueDate : "2022-03-21T00:00:00"
/// LastPaymentAmount : "5.00"
/// LastPaymentDate : "2022-01-04T00:00:00"
/// OverdueBalance : "28.14"
/// PendingPaymentAmount : ["_text"]
/// LastBillAmount : "112.70"
/// TotalBalance : "112.70"

class Payload {
  Payload({
      String? accountNumber, 
      String? billingAddress, 
      dynamic customerFirstName, 
      String? customerLastName, 
      String? customerPhoneNumber, 
      String? lastBillDueDate, 
      String? lastPaymentAmount, 
      String? lastPaymentDate, 
      String? overdueBalance, 
      List<String>? pendingPaymentAmount, 
      String? lastBillAmount, 
      String? totalBalance,}){
    _accountNumber = accountNumber;
    _billingAddress = billingAddress;
    _customerFirstName = customerFirstName;
    _customerLastName = customerLastName;
    _customerPhoneNumber = customerPhoneNumber;
    _lastBillDueDate = lastBillDueDate;
    _lastPaymentAmount = lastPaymentAmount;
    _lastPaymentDate = lastPaymentDate;
    _overdueBalance = overdueBalance;
    _pendingPaymentAmount = pendingPaymentAmount;
    _lastBillAmount = lastBillAmount;
    _totalBalance = totalBalance;
}

  Payload.fromJson(dynamic json) {
    _accountNumber = json['AccountNumber'];
    _billingAddress = json['BillingAddress'];
    _customerFirstName = json['CustomerFirstName'];
    _customerLastName = json['CustomerLastName'];
    _customerPhoneNumber = json['CustomerPhoneNumber'];
    _lastBillDueDate = json['LastBillDueDate'];
    _lastPaymentAmount = json['LastPaymentAmount'];
    _lastPaymentDate = json['LastPaymentDate'];
    _overdueBalance = json['OverdueBalance'];
    _pendingPaymentAmount = json['PendingPaymentAmount'] != null ? json['PendingPaymentAmount'].cast<String>() : [];
    _lastBillAmount = json['LastBillAmount'];
    _totalBalance = json['TotalBalance'];
  }
  String? _accountNumber;
  String? _billingAddress;
  dynamic _customerFirstName;
  String? _customerLastName;
  String? _customerPhoneNumber;
  String? _lastBillDueDate;
  String? _lastPaymentAmount;
  String? _lastPaymentDate;
  String? _overdueBalance;
  List<String>? _pendingPaymentAmount;
  String? _lastBillAmount;
  String? _totalBalance;

  String? get accountNumber => _accountNumber;
  String? get billingAddress => _billingAddress;
  dynamic get customerFirstName => _customerFirstName;
  String? get customerLastName => _customerLastName;
  String? get customerPhoneNumber => _customerPhoneNumber;
  String? get lastBillDueDate => _lastBillDueDate;
  String? get lastPaymentAmount => _lastPaymentAmount;
  String? get lastPaymentDate => _lastPaymentDate;
  String? get overdueBalance => _overdueBalance;
  List<String>? get pendingPaymentAmount => _pendingPaymentAmount;
  String? get lastBillAmount => _lastBillAmount;
  String? get totalBalance => _totalBalance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['AccountNumber'] = _accountNumber;
    map['BillingAddress'] = _billingAddress;
    map['CustomerFirstName'] = _customerFirstName;
    map['CustomerLastName'] = _customerLastName;
    map['CustomerPhoneNumber'] = _customerPhoneNumber;
    map['LastBillDueDate'] = _lastBillDueDate;
    map['LastPaymentAmount'] = _lastPaymentAmount;
    map['LastPaymentDate'] = _lastPaymentDate;
    map['OverdueBalance'] = _overdueBalance;
    map['PendingPaymentAmount'] = _pendingPaymentAmount;
    map['LastBillAmount'] = _lastBillAmount;
    map['TotalBalance'] = _totalBalance;
    return map;
  }

}