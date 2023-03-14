/// issuccess : true
/// payload : [{"Transaction_ID":"2203020846896","Keyword":"PMNT","Source_Wallet_ID":"85513333444","Dest_Wallet_ID":"85511234567","Amount":9.82,"Souce_Balance_Before":132.32,"Source_Balance_After":122.5,"Dest_Balance_Before":4326.58,"Dest_Balance_After":4336.4,"Created_Date":"2022-03-02T08:30:40.070Z","Transaction_Fee":0.18,"Transaction_Comm":0,"Status":0,"Reference_ID":"me","Fee_Payer":"85511234567","Commission_Receiver":"85513333444","Reward_Receiver":null,"Reward_Point":null,"Distributer_Commission":0,"Distributer_Msisdn":null,"TransactionDate":"2022-03-02T08:30:40.070Z","Currency":"XCD","Ex_Rate":0,"Exchanged_Amount":10,"Keyword_Description":"Pay Merchant"},{"Transaction_ID":"2203020846895","Keyword":"MGIV","Source_Wallet_ID":"85511234567","Dest_Wallet_ID":"85534292667","Amount":10,"Souce_Balance_Before":4336.58,"Source_Balance_After":4326.58,"Dest_Balance_Before":1160,"Dest_Balance_After":1170,"Created_Date":"2022-03-02T08:28:56.260Z","Transaction_Fee":0.17,"Transaction_Comm":0,"Status":0,"Reference_ID":null,"Fee_Payer":"85511234567","Commission_Receiver":null,"Reward_Receiver":null,"Reward_Point":null,"Distributer_Commission":null,"Distributer_Msisdn":null,"TransactionDate":"2022-03-02T08:28:56.260Z","Currency":"XCD","Ex_Rate":0,"Exchanged_Amount":10.17,"Keyword_Description":"Merchant Cash Out"},{"Transaction_ID":"2203020746893","Keyword":"MGIV","Source_Wallet_ID":"85511234567","Dest_Wallet_ID":"85534292667","Amount":10,"Souce_Balance_Before":4346.76,"Source_Balance_After":4336.76,"Dest_Balance_Before":1150,"Dest_Balance_After":1160,"Created_Date":"2022-03-02T07:44:34.350Z","Transaction_Fee":0.17,"Transaction_Comm":0,"Status":0,"Reference_ID":null,"Fee_Payer":"85511234567","Commission_Receiver":null,"Reward_Receiver":null,"Reward_Point":null,"Distributer_Commission":null,"Distributer_Msisdn":null,"TransactionDate":"2022-03-02T07:44:34.350Z","Currency":"XCD","Ex_Rate":0,"Exchanged_Amount":10.17,"Keyword_Description":"Merchant Cash Out"},{"Transaction_ID":"2203011246892","Keyword":"PMNT","Source_Wallet_ID":"85513333444","Dest_Wallet_ID":"85511234567","Amount":9.82,"Souce_Balance_Before":142.32,"Source_Balance_After":132.5,"Dest_Balance_Before":4337.12,"Dest_Balance_After":4346.94,"Created_Date":"2022-03-01T12:49:53.473Z","Transaction_Fee":0.18,"Transaction_Comm":0,"Status":0,"Reference_ID":"me","Fee_Payer":"85511234567","Commission_Receiver":"85513333444","Reward_Receiver":null,"Reward_Point":null,"Distributer_Commission":0,"Distributer_Msisdn":null,"TransactionDate":"2022-03-01T12:49:53.473Z","Currency":"XCD","Ex_Rate":0,"Exchanged_Amount":10,"Keyword_Description":"Pay Merchant"},{"Transaction_ID":"2202281446885","Keyword":"MGIV","Source_Wallet_ID":"85511234567","Dest_Wallet_ID":"85534292667","Amount":20,"Souce_Balance_Before":4357.12,"Source_Balance_After":4337.12,"Dest_Balance_Before":1130,"Dest_Balance_After":1150,"Created_Date":"2022-02-28T14:32:36.043Z","Transaction_Fee":0.35,"Transaction_Comm":0,"Status":0,"Reference_ID":null,"Fee_Payer":"85511234567","Commission_Receiver":null,"Reward_Receiver":null,"Reward_Point":null,"Distributer_Commission":null,"Distributer_Msisdn":null,"TransactionDate":"2022-02-28T14:32:36.043Z","Currency":"XCD","Ex_Rate":0,"Exchanged_Amount":20.35,"Keyword_Description":"Merchant Cash Out"},{"Transaction_ID":"2202281146881","Keyword":"MGIV","Source_Wallet_ID":"85511234567","Dest_Wallet_ID":"85534292667","Amount":10,"Souce_Balance_Before":4367.47,"Source_Balance_After":4357.47,"Dest_Balance_Before":1120,"Dest_Balance_After":1130,"Created_Date":"2022-02-28T11:34:51.243Z","Transaction_Fee":0.17,"Transaction_Comm":0,"Status":0,"Reference_ID":null,"Fee_Payer":"85511234567","Commission_Receiver":null,"Reward_Receiver":null,"Reward_Point":null,"Distributer_Commission":null,"Distributer_Msisdn":null,"TransactionDate":"2022-02-28T11:34:51.243Z","Currency":"XCD","Ex_Rate":0,"Exchanged_Amount":10.17,"Keyword_Description":"Merchant Cash Out"},{"Transaction_ID":"2202211246875","Keyword":"MGIV","Source_Wallet_ID":"85511234567","Dest_Wallet_ID":"85534292667","Amount":10,"Souce_Balance_Before":4377.65,"Source_Balance_After":4367.65,"Dest_Balance_Before":1110,"Dest_Balance_After":1120,"Created_Date":"2022-02-21T12:38:43.330Z","Transaction_Fee":0.17,"Transaction_Comm":0,"Status":0,"Reference_ID":null,"Fee_Payer":"85511234567","Commission_Receiver":null,"Reward_Receiver":null,"Reward_Point":null,"Distributer_Commission":null,"Distributer_Msisdn":null,"TransactionDate":"2022-02-21T12:38:43.330Z","Currency":"XCD","Ex_Rate":0,"Exchanged_Amount":10.17,"Keyword_Description":"Merchant Cash Out"}]
/// message : "The request has succeeded"

class ReportResponse {
  ReportResponse({
      bool? issuccess, 
      List<Payload>? payload, 
      String? message,}){
    _issuccess = issuccess;
    _payload = payload;
    _message = message;
}

  ReportResponse.fromJson(dynamic json) {
    _issuccess = json['issuccess'];
    if (json['payload'] != null) {
      _payload = [];
      json['payload'].forEach((v) {
        _payload?.add(Payload.fromJson(v));
      });
    }
    _message = json['message'];
  }
  bool? _issuccess;
  List<Payload>? _payload;
  String? _message;

  bool? get issuccess => _issuccess;
  List<Payload>? get payload => _payload;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['issuccess'] = _issuccess;
    if (_payload != null) {
      map['payload'] = _payload?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

/// Transaction_ID : "2203020846896"
/// Keyword : "PMNT"
/// Source_Wallet_ID : "85513333444"
/// Dest_Wallet_ID : "85511234567"
/// Amount : 9.82
/// Souce_Balance_Before : 132.32
/// Source_Balance_After : 122.5
/// Dest_Balance_Before : 4326.58
/// Dest_Balance_After : 4336.4
/// Created_Date : "2022-03-02T08:30:40.070Z"
/// Transaction_Fee : 0.18
/// Transaction_Comm : 0
/// Status : 0
/// Reference_ID : "me"
/// Fee_Payer : "85511234567"
/// Commission_Receiver : "85513333444"
/// Reward_Receiver : null
/// Reward_Point : null
/// Distributer_Commission : 0
/// Distributer_Msisdn : null
/// TransactionDate : "2022-03-02T08:30:40.070Z"
/// Currency : "XCD"
/// Ex_Rate : 0
/// Exchanged_Amount : 10
/// Keyword_Description : "Pay Merchant"

class Payload {
  Payload({
      String? transactionID, 
      String? keyword, 
      String? sourceWalletID, 
      String? destWalletID, 
      double? amount, 
      double? souceBalanceBefore, 
      double? sourceBalanceAfter, 
      double? destBalanceBefore, 
      double? destBalanceAfter, 
      String? createdDate, 
      double? transactionFee, 
      int? transactionComm, 
      int? status, 
      String? referenceID, 
      String? feePayer, 
      String? commissionReceiver, 
      dynamic rewardReceiver, 
      dynamic rewardPoint, 
      int? distributerCommission, 
      dynamic distributerMsisdn, 
      String? transactionDate, 
      String? currency, 
      int? exRate, 

      String? keywordDescription,}){
    _transactionID = transactionID;
    _keyword = keyword;
    _sourceWalletID = sourceWalletID;
    _destWalletID = destWalletID;
    _amount = amount;
    _souceBalanceBefore = souceBalanceBefore;
    _sourceBalanceAfter = sourceBalanceAfter;
    _destBalanceBefore = destBalanceBefore;
    _destBalanceAfter = destBalanceAfter;
    _createdDate = createdDate;
    _transactionFee = transactionFee;
    _transactionComm = transactionComm;
    _status = status;
    _referenceID = referenceID;
    _feePayer = feePayer;
    _commissionReceiver = commissionReceiver;
    _rewardReceiver = rewardReceiver;
    _rewardPoint = rewardPoint;
    _distributerCommission = distributerCommission;
    _distributerMsisdn = distributerMsisdn;
    _transactionDate = transactionDate;
    _currency = currency;
    _exRate = exRate;
    _keywordDescription = keywordDescription;
}

  Payload.fromJson(dynamic json) {
    _transactionID = json['Transaction_ID'];
    _keyword = json['Keyword'];
    _sourceWalletID = json['Source_Wallet_ID'];
    _destWalletID = json['Dest_Wallet_ID'];
    _amount = double.parse(json['Amount'].toString());
    _souceBalanceBefore = double.parse(json['Souce_Balance_Before'].toString());
    _sourceBalanceAfter = double.parse(json['Source_Balance_After'].toString());
    _destBalanceBefore = double.parse(json['Dest_Balance_Before'].toString());
    _destBalanceAfter = double.parse(json['Dest_Balance_After'].toString());
    _createdDate = json['Created_Date'];
    _transactionFee = double.parse(json['Transaction_Fee'].toString());
    _transactionComm = json['Transaction_Comm'];
    _status = json['Status'];
    _referenceID = json['Reference_ID'];
    _feePayer = json['Fee_Payer'];
    _commissionReceiver = json['Commission_Receiver'];
    _rewardReceiver = json['Reward_Receiver'];
    _rewardPoint = json['Reward_Point'];
    _distributerCommission = json['Distributer_Commission'];
    _distributerMsisdn = json['Distributer_Msisdn'];
    _transactionDate = json['TransactionDate'];
    _currency = json['Currency'];
    _exRate = json['Ex_Rate'];

    _keywordDescription = json['Keyword_Description'];
  }
  String? _transactionID;
  String? _keyword;
  String? _sourceWalletID;
  String? _destWalletID;
  double? _amount;
  double? _souceBalanceBefore;
  double? _sourceBalanceAfter;
  double? _destBalanceBefore;
  double? _destBalanceAfter;
  String? _createdDate;
  double? _transactionFee;
  int? _transactionComm;
  int? _status;
  String? _referenceID;
  String? _feePayer;
  String? _commissionReceiver;
  dynamic _rewardReceiver;
  dynamic _rewardPoint;
  int? _distributerCommission;
  dynamic _distributerMsisdn;
  String? _transactionDate;
  String? _currency;
  int? _exRate;

  String? _keywordDescription;

  String? get transactionID => _transactionID;
  String? get keyword => _keyword;
  String? get sourceWalletID => _sourceWalletID;
  String? get destWalletID => _destWalletID;
  double? get amount => _amount;
  double? get souceBalanceBefore => _souceBalanceBefore;
  double? get sourceBalanceAfter => _sourceBalanceAfter;
  double? get destBalanceBefore => _destBalanceBefore;
  double? get destBalanceAfter => _destBalanceAfter;
  String? get createdDate => _createdDate;
  double? get transactionFee => _transactionFee;
  int? get transactionComm => _transactionComm;
  int? get status => _status;
  String? get referenceID => _referenceID;
  String? get feePayer => _feePayer;
  String? get commissionReceiver => _commissionReceiver;
  dynamic get rewardReceiver => _rewardReceiver;
  dynamic get rewardPoint => _rewardPoint;
  int? get distributerCommission => _distributerCommission;
  dynamic get distributerMsisdn => _distributerMsisdn;
  String? get transactionDate => _transactionDate;
  String? get currency => _currency;
  int? get exRate => _exRate;
  String? get keywordDescription => _keywordDescription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Transaction_ID'] = _transactionID;
    map['Keyword'] = _keyword;
    map['Source_Wallet_ID'] = _sourceWalletID;
    map['Dest_Wallet_ID'] = _destWalletID;
    map['Amount'] = _amount;
    map['Souce_Balance_Before'] = _souceBalanceBefore;
    map['Source_Balance_After'] = _sourceBalanceAfter;
    map['Dest_Balance_Before'] = _destBalanceBefore;
    map['Dest_Balance_After'] = _destBalanceAfter;
    map['Created_Date'] = _createdDate;
    map['Transaction_Fee'] = _transactionFee;
    map['Transaction_Comm'] = _transactionComm;
    map['Status'] = _status;
    map['Reference_ID'] = _referenceID;
    map['Fee_Payer'] = _feePayer;
    map['Commission_Receiver'] = _commissionReceiver;
    map['Reward_Receiver'] = _rewardReceiver;
    map['Reward_Point'] = _rewardPoint;
    map['Distributer_Commission'] = _distributerCommission;
    map['Distributer_Msisdn'] = _distributerMsisdn;
    map['TransactionDate'] = _transactionDate;
    map['Currency'] = _currency;
    map['Ex_Rate'] = _exRate;
    map['Keyword_Description'] = _keywordDescription;
    return map;
  }

}