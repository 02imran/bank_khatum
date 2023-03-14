import 'dart:ffi';

/// issuccess : true
/// payload : {"Wallet_MSISDN":"85511234567","Wallet_Code":107,"Amount":4316.76,"Created_By":"rosebaysupport","Created_Date":"2021-12-22T02:44:02.260Z","Status":0,"Last_Transaction_ID":"1646213475638","Last_Transaction_Amount":9.82,"Balance_Before":4326.58,"Modified_By":null,"Modified_Date":null,"Current_Year_Reward_Point":null,"Last_Year_Reward_Point":null}
/// message : "The request has succeeded"


class BalanceResponse {
  BalanceResponse({
      bool? issuccess, 
      Payload? payload, 
      String? message,}){
    _issuccess = issuccess;
    _payload = payload;
    _message = message;
}

  BalanceResponse.fromJson(dynamic json) {
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

/// Wallet_MSISDN : "85511234567"
/// Wallet_Code : 107
/// Amount : 4316.76
/// Created_By : "rosebaysupport"
/// Created_Date : "2021-12-22T02:44:02.260Z"
/// Status : 0
/// Last_Transaction_ID : "1646213475638"
/// Last_Transaction_Amount : 9.82
/// Balance_Before : 4326.58
/// Modified_By : null
/// Modified_Date : null
/// Current_Year_Reward_Point : null
/// Last_Year_Reward_Point : null

class Payload {
  Payload({
      String? walletMSISDN, 
      int? walletCode, 
      double? amount, 
      String? createdBy, 
      String? createdDate, 
      int? status, 
      String? lastTransactionID, 
     // double? lastTransactionAmount,
      //double? balanceBefore,
      dynamic modifiedBy, 
      dynamic modifiedDate, 
      dynamic currentYearRewardPoint, 
      dynamic lastYearRewardPoint,}){
    _walletMSISDN = walletMSISDN;
    _walletCode = walletCode;
    _amount = amount;
    _createdBy = createdBy;
    _createdDate = createdDate;
    _status = status;
    _lastTransactionID = lastTransactionID;
  //  _lastTransactionAmount = lastTransactionAmount;
    //_balanceBefore = balanceBefore;
    _modifiedBy = modifiedBy;
    _modifiedDate = modifiedDate;
    _currentYearRewardPoint = currentYearRewardPoint;
    _lastYearRewardPoint = lastYearRewardPoint;
}

  Payload.fromJson(dynamic json) {
    _walletMSISDN = json['Wallet_MSISDN'];
    _walletCode = json['Wallet_Code'];
    _amount = double.parse(json['Amount'].toString());
    _createdBy = json['Created_By'];
    _createdDate = json['Created_Date'];
    _status = json['Status'];
    _lastTransactionID = json['Last_Transaction_ID'];
   // _lastTransactionAmount = double.parse(json['Last_Transaction_Amount'].toString());
   // _balanceBefore = double.parse(json['Balance_Before'].toString());
    _modifiedBy = json['Modified_By'];
    _modifiedDate = json['Modified_Date'];
    _currentYearRewardPoint = json['Current_Year_Reward_Point'];
    _lastYearRewardPoint = json['Last_Year_Reward_Point'];
  }
  String? _walletMSISDN;
  int? _walletCode;
  double? _amount;
  String? _createdBy;
  String? _createdDate;
  int? _status;
  String? _lastTransactionID;
 // double? _lastTransactionAmount;
  //double? _balanceBefore;
  dynamic _modifiedBy;
  dynamic _modifiedDate;
  dynamic _currentYearRewardPoint;
  dynamic _lastYearRewardPoint;

  String? get walletMSISDN => _walletMSISDN;
  int? get walletCode => _walletCode;
  double? get amount => _amount;
  String? get createdBy => _createdBy;
  String? get createdDate => _createdDate;
  int? get status => _status;
  String? get lastTransactionID => _lastTransactionID;
  //double? get lastTransactionAmount => _lastTransactionAmount;
  //double? get balanceBefore => _balanceBefore;
  dynamic get modifiedBy => _modifiedBy;
  dynamic get modifiedDate => _modifiedDate;
  dynamic get currentYearRewardPoint => _currentYearRewardPoint;
  dynamic get lastYearRewardPoint => _lastYearRewardPoint;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Wallet_MSISDN'] = _walletMSISDN;
    map['Wallet_Code'] = _walletCode;
    map['Amount'] = _amount;
    map['Created_By'] = _createdBy;
    map['Created_Date'] = _createdDate;
    map['Status'] = _status;
    map['Last_Transaction_ID'] = _lastTransactionID;
   // map['Last_Transaction_Amount'] = _lastTransactionAmount;
    //map['Balance_Before'] = _balanceBefore;
    map['Modified_By'] = _modifiedBy;
    map['Modified_Date'] = _modifiedDate;
    map['Current_Year_Reward_Point'] = _currentYearRewardPoint;
    map['Last_Year_Reward_Point'] = _lastYearRewardPoint;
    return map;
  }

}