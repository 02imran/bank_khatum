/// TransactionDate : "2022-02-15 12:16:00"
/// StatusCode : 0
/// StatusMsg : "Success"
/// CurrentBalance : "4378"
/// RewardPoint : "0"
/// ChargeAmount : "0"
/// ChargePayer : "85511234567"
/// CommissionAmount : "0"
/// CommissionReceiver : "0"
/// RewardReceiver : ""
/// TransactionAmount : "10"
/// StatusMsgLocal : "ជោគជ័យ"
/// ExtraNotification : ""
/// Msisdn : "85511234567"
/// ResponseCode : 100
/// ResponseDescription : "Success"
/// ResponseDescriptionLocal : null
/// TransactionId : "2202151246862"
/// data : null





class SuccessResponse {
  SuccessResponse({
    String? transactionDate,
    int? statusCode,
    String? statusMsg,
    dynamic currentBalance,
    dynamic rewardPoint,
    dynamic chargeAmount,
    String? chargePayer,
    dynamic commissionAmount,
    dynamic commissionReceiver,
    dynamic rewardReceiver,
    dynamic transactionAmount,
    dynamic statusMsgLocal,
    String? extraNotification,
    String? msisdn,
    int? responseCode,
    String? responseDescription,
    dynamic responseDescriptionLocal,
    String? transactionId,
    dynamic data,}){
    _transactionDate = transactionDate;
    _statusCode = statusCode;
    _statusMsg = statusMsg;
    _currentBalance = currentBalance;
    _rewardPoint = rewardPoint;
    _chargeAmount = chargeAmount;
    _chargePayer = chargePayer;
    _commissionAmount = commissionAmount;
    _commissionReceiver = commissionReceiver;
    _rewardReceiver = rewardReceiver;
    _transactionAmount = transactionAmount;
    _statusMsgLocal = statusMsgLocal;
    _extraNotification = extraNotification;
    _msisdn = msisdn;
    _responseCode = responseCode;
    _responseDescription = responseDescription;
    _responseDescriptionLocal = responseDescriptionLocal;
    _transactionId = transactionId;
    _data = data;
  }

  SuccessResponse.fromJson(dynamic json) {
    _transactionDate = json['TransactionDate'];
    _statusCode = json['StatusCode'];
    _statusMsg = json['StatusMsg'];
    _currentBalance = json['CurrentBalance'];
    _rewardPoint = json['RewardPoint'];
    _chargeAmount = json['ChargeAmount'];
    _chargePayer = json['ChargePayer'];
    _commissionAmount = json['CommissionAmount'];
    _commissionReceiver = json['CommissionReceiver'];
    _rewardReceiver = json['RewardReceiver'];
    _transactionAmount = json['TransactionAmount'];
    _statusMsgLocal = json['StatusMsgLocal'];
    _extraNotification = json['ExtraNotification'];
    _msisdn = json['Msisdn'];
    _responseCode = json['ResponseCode'];
    _responseDescription = json['ResponseDescription'];
    _responseDescriptionLocal = json['ResponseDescriptionLocal'];
    _transactionId = json['TransactionId'];
    _data = json['data'];
  }
  String? _transactionDate;
  int? _statusCode;
  String? _statusMsg;
  dynamic _currentBalance;
  dynamic _rewardPoint;
  dynamic _chargeAmount;
  String? _chargePayer;
  dynamic _commissionAmount;
  dynamic _commissionReceiver;
  dynamic _rewardReceiver;
  dynamic _transactionAmount;
  dynamic _statusMsgLocal;
  String? _extraNotification;
  String? _msisdn;
  int? _responseCode;
  String? _responseDescription;
  dynamic _responseDescriptionLocal;
  String? _transactionId;
  dynamic _data;

  String? get transactionDate => _transactionDate;
  int? get statusCode => _statusCode;
  String? get statusMsg => _statusMsg;
  dynamic get currentBalance => _currentBalance;
  dynamic get rewardPoint => _rewardPoint;
  dynamic get chargeAmount => _chargeAmount;
  String? get chargePayer => _chargePayer;
  dynamic get commissionAmount => _commissionAmount;
  dynamic get commissionReceiver => _commissionReceiver;
  dynamic get rewardReceiver => _rewardReceiver;
  dynamic get transactionAmount => _transactionAmount;
  dynamic get statusMsgLocal => _statusMsgLocal;
  String? get extraNotification => _extraNotification;
  String? get msisdn => _msisdn;
  int? get responseCode => _responseCode;
  String? get responseDescription => _responseDescription;
  dynamic get responseDescriptionLocal => _responseDescriptionLocal;
  String? get transactionId => _transactionId;
  dynamic get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TransactionDate'] = _transactionDate;
    map['StatusCode'] = _statusCode;
    map['StatusMsg'] = _statusMsg;
    map['CurrentBalance'] = _currentBalance;
    map['RewardPoint'] = _rewardPoint;
    map['ChargeAmount'] = _chargeAmount;
    map['ChargePayer'] = _chargePayer;
    map['CommissionAmount'] = _commissionAmount;
    map['CommissionReceiver'] = _commissionReceiver;
    map['RewardReceiver'] = _rewardReceiver;
    map['TransactionAmount'] = _transactionAmount;
    map['StatusMsgLocal'] = _statusMsgLocal;
    map['ExtraNotification'] = _extraNotification;
    map['Msisdn'] = _msisdn;
    map['ResponseCode'] = _responseCode;
    map['ResponseDescription'] = _responseDescription;
    map['ResponseDescriptionLocal'] = _responseDescriptionLocal;
    map['TransactionId'] = _transactionId;
    map['data'] = _data;
    return map;
  }

}