/// Keyword : null
/// DestinationFullName : "Test3 Aeon3"
/// DestinationMsisdn : "85513333444"
/// CurrentBalance : null
/// ChargeAmount : null
/// ChargePayer : null
/// CommissionAmount : null
/// CommissionReceiver : null
/// ConvertedAmount : null
/// Rate : null
/// Amount : "10"
/// RewardPoint : ""
/// ReferenceId : "me"
/// AttemptLeft : 0
/// Msisdn : "85511234567"
/// ResponseCode : 100
/// ResponseDescription : "Success"
/// ResponseDescriptionLocal : ""
/// TransactionId : "2203020846896"
/// data : null

class CheckRefundResponse {
  CheckRefundResponse({
      dynamic keyword, 
      String? destinationFullName, 
      String? destinationMsisdn, 
      dynamic currentBalance, 
      dynamic chargeAmount, 
      dynamic chargePayer, 
      dynamic commissionAmount, 
      dynamic commissionReceiver, 
      dynamic convertedAmount, 
      dynamic rate, 
      String? amount, 
      String? rewardPoint, 
      String? referenceId, 
      int? attemptLeft, 
      String? msisdn, 
      int? responseCode, 
      String? responseDescription, 
      String? responseDescriptionLocal, 
      String? transactionId, 
      dynamic data,}){
    _keyword = keyword;
    _destinationFullName = destinationFullName;
    _destinationMsisdn = destinationMsisdn;
    _currentBalance = currentBalance;
    _chargeAmount = chargeAmount;
    _chargePayer = chargePayer;
    _commissionAmount = commissionAmount;
    _commissionReceiver = commissionReceiver;
    _convertedAmount = convertedAmount;
    _rate = rate;
    _amount = amount;
    _rewardPoint = rewardPoint;
    _referenceId = referenceId;
    _attemptLeft = attemptLeft;
    _msisdn = msisdn;
    _responseCode = responseCode;
    _responseDescription = responseDescription;
    _responseDescriptionLocal = responseDescriptionLocal;
    _transactionId = transactionId;
    _data = data;
}

  CheckRefundResponse.fromJson(dynamic json) {
    _keyword = json['Keyword'];
    _destinationFullName = json['DestinationFullName'];
    _destinationMsisdn = json['DestinationMsisdn'];
    _currentBalance = json['CurrentBalance'];
    _chargeAmount = json['ChargeAmount'];
    _chargePayer = json['ChargePayer'];
    _commissionAmount = json['CommissionAmount'];
    _commissionReceiver = json['CommissionReceiver'];
    _convertedAmount = json['ConvertedAmount'];
    _rate = json['Rate'];
    _amount = json['Amount'];
    _rewardPoint = json['RewardPoint'];
    _referenceId = json['ReferenceId'];
    _attemptLeft = json['AttemptLeft'];
    _msisdn = json['Msisdn'];
    _responseCode = json['ResponseCode'];
    _responseDescription = json['ResponseDescription'];
    _responseDescriptionLocal = json['ResponseDescriptionLocal'];
    _transactionId = json['TransactionId'];
    _data = json['data'];
  }
  dynamic _keyword;
  String? _destinationFullName;
  String? _destinationMsisdn;
  dynamic _currentBalance;
  dynamic _chargeAmount;
  dynamic _chargePayer;
  dynamic _commissionAmount;
  dynamic _commissionReceiver;
  dynamic _convertedAmount;
  dynamic _rate;
  String? _amount;
  String? _rewardPoint;
  String? _referenceId;
  int? _attemptLeft;
  String? _msisdn;
  int? _responseCode;
  String? _responseDescription;
  String? _responseDescriptionLocal;
  String? _transactionId;
  dynamic _data;

  dynamic get keyword => _keyword;
  String? get destinationFullName => _destinationFullName;
  String? get destinationMsisdn => _destinationMsisdn;
  dynamic get currentBalance => _currentBalance;
  dynamic get chargeAmount => _chargeAmount;
  dynamic get chargePayer => _chargePayer;
  dynamic get commissionAmount => _commissionAmount;
  dynamic get commissionReceiver => _commissionReceiver;
  dynamic get convertedAmount => _convertedAmount;
  dynamic get rate => _rate;
  String? get amount => _amount;
  String? get rewardPoint => _rewardPoint;
  String? get referenceId => _referenceId;
  int? get attemptLeft => _attemptLeft;
  String? get msisdn => _msisdn;
  int? get responseCode => _responseCode;
  String? get responseDescription => _responseDescription;
  String? get responseDescriptionLocal => _responseDescriptionLocal;
  String? get transactionId => _transactionId;
  dynamic get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Keyword'] = _keyword;
    map['DestinationFullName'] = _destinationFullName;
    map['DestinationMsisdn'] = _destinationMsisdn;
    map['CurrentBalance'] = _currentBalance;
    map['ChargeAmount'] = _chargeAmount;
    map['ChargePayer'] = _chargePayer;
    map['CommissionAmount'] = _commissionAmount;
    map['CommissionReceiver'] = _commissionReceiver;
    map['ConvertedAmount'] = _convertedAmount;
    map['Rate'] = _rate;
    map['Amount'] = _amount;
    map['RewardPoint'] = _rewardPoint;
    map['ReferenceId'] = _referenceId;
    map['AttemptLeft'] = _attemptLeft;
    map['Msisdn'] = _msisdn;
    map['ResponseCode'] = _responseCode;
    map['ResponseDescription'] = _responseDescription;
    map['ResponseDescriptionLocal'] = _responseDescriptionLocal;
    map['TransactionId'] = _transactionId;
    map['data'] = _data;
    return map;
  }

}