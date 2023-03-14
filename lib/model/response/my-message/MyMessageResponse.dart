/// UserMessageList : [{"Date":"03/15/2022 11:15:28","Message":"Dear user, Your Verification Code for AEON Wallet App is: 244268.","Status":"Sent"},{"Date":"03/14/2022 4:46:25","Message":"Dear user, Your Verification Code for AEON Wallet App is: 328407.","Status":"Sent"},{"Date":"03/14/2022 1:39:43","Message":"Dear user, Your Verification Code for AEON Wallet App is: 010742.","Status":"Sent"},{"Date":"03/14/2022 1:10:16","Message":"Dear user, Your Verification Code for AEON Wallet App is: 727621.","Status":"Sent"},{"Date":"03/14/2022 1:04:53","Message":"Dear user, Your Verification Code for AEON Wallet App is: 160864.","Status":"Sent"},{"Date":"03/14/2022 11:44:08","Message":"Dear User, You have transferred 100 XCD to Master(+9800000110).Transaction ID: 2203141146958.","Status":"Sent"},{"Date":"03/14/2022 11:00:35","Message":"Dear User, You have transferred 10 XCD to md mahfuj (+85578965412).Transaction ID: 2203141146957.","Status":"Sent"},{"Date":"03/10/2022 1:29:50","Message":"You have successfully enrolled md mofiz (+855622555622) as AEON Wallet Agent via testtingagent(+85537866093).Transaction ID: 2203101346948.","Status":"Sent"},{"Date":"03/10/2022 1:27:51","Message":"You have successfully enrolled md mahfuj alam (+855233258555) as AEON Wallet Agent via testtingagent(+85537866093).Transaction ID: 2203101346947.","Status":"Sent"},{"Date":"03/10/2022 10:47:31","Message":"Dear user, Your Verification Code for AEON Wallet App is: 220314.","Status":"Sent"},{"Date":"03/10/2022 10:43:28","Message":"Dear User, You have transferred 100 XCD to Master(+9800000110).Transaction ID: 2203101046944.","Status":"Sent"},{"Date":"03/10/2022 10:42:11","Message":"Dear User, You have transferred 100 XCD to Master(+9800000110).Transaction ID: 2203101046943.","Status":"Sent"},{"Date":"03/10/2022 10:37:52","Message":"Dear User, You have transferred 100 XCD to md mahfuj (+85578965412).Transaction ID: 2203101046942.","Status":"Sent"},{"Date":"03/10/2022 10:34:22","Message":"You have successfully enrolled md mahfuj (+85578965412) as AEON Wallet Agent via testtingagent(+85537866093).Transaction ID: 2203101046941.","Status":"Sent"},{"Date":"03/08/2022 11:00:50","Message":"Dear User, You have received 10 XCD from aeon merchant(+85511234567). Please handover the cash.Transaction ID: 2203081146937.","Status":"Sent"},{"Date":"03/08/2022 10:32:12","Message":"Dear User, You transferred 10 XCD to Test3 Aeon3(+85513333444). Your new balance is 990 XCD.Transaction ID: 2203081046934.","Status":"Sent"},{"Date":"03/07/2022 11:09:37","Message":"Dear user, Your Verification Code for AEON Wallet App is: 134777.","Status":"Sent"},{"Date":"03/02/2022 1:16:45","Message":"Dear User, You have received 5 XCD from Ashiqur Rahman(+855112233445). Please make payment to customer.Transaction ID: 2203021346900.","Status":"Sent"},{"Date":"02/17/2022 6:35:54","Message":"Dear User, You are successfully enrolled in AEON Wallet. Your PIN is 1199.","Status":"Sent"}]
/// Msisdn : "85537866093"
/// ResponseCode : 100
/// ResponseDescription : "Success"
/// ResponseDescriptionLocal : ""
/// TransactionId : null
/// data : null





class MyMessageResponse {
  MyMessageResponse({
      List<UserMessageList>? userMessageList, 
      String? msisdn, 
      int? responseCode, 
      String? responseDescription, 
      String? responseDescriptionLocal, 
      dynamic transactionId, 
      dynamic data,}){
    _userMessageList = userMessageList;
    _msisdn = msisdn;
    _responseCode = responseCode;
    _responseDescription = responseDescription;
    _responseDescriptionLocal = responseDescriptionLocal;
    _transactionId = transactionId;
    _data = data;
}

  MyMessageResponse.fromJson(dynamic json) {
    if (json['UserMessageList'] != null) {
      _userMessageList = [];
      json['UserMessageList'].forEach((v) {
        _userMessageList?.add(UserMessageList.fromJson(v));
      });
    }
    _msisdn = json['Msisdn'];
    _responseCode = json['ResponseCode'];
    _responseDescription = json['ResponseDescription'];
    _responseDescriptionLocal = json['ResponseDescriptionLocal'];
    _transactionId = json['TransactionId'];
    _data = json['data'];
  }
  List<UserMessageList>? _userMessageList;
  String? _msisdn;
  int? _responseCode;
  String? _responseDescription;
  String? _responseDescriptionLocal;
  dynamic _transactionId;
  dynamic _data;

  List<UserMessageList>? get userMessageList => _userMessageList;
  String? get msisdn => _msisdn;
  int? get responseCode => _responseCode;
  String? get responseDescription => _responseDescription;
  String? get responseDescriptionLocal => _responseDescriptionLocal;
  dynamic get transactionId => _transactionId;
  dynamic get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_userMessageList != null) {
      map['UserMessageList'] = _userMessageList?.map((v) => v.toJson()).toList();
    }
    map['Msisdn'] = _msisdn;
    map['ResponseCode'] = _responseCode;
    map['ResponseDescription'] = _responseDescription;
    map['ResponseDescriptionLocal'] = _responseDescriptionLocal;
    map['TransactionId'] = _transactionId;
    map['data'] = _data;
    return map;
  }

}

/// Date : "03/15/2022 11:15:28"
/// Message : "Dear user, Your Verification Code for AEON Wallet App is: 244268."
/// Status : "Sent"

class UserMessageList {
  UserMessageList({
      String? date, 
      String? message, 
      String? status,}){
    _date = date;
    _message = message;
    _status = status;
}

  UserMessageList.fromJson(dynamic json) {
    _date = json['Date'];
    _message = json['Message'];
    _status = json['Status'];
  }
  String? _date;
  String? _message;
  String? _status;

  String? get date => _date;
  String? get message => _message;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Date'] = _date;
    map['Message'] = _message;
    map['Status'] = _status;
    return map;
  }

}