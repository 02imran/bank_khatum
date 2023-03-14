class AmlResponse {
  AmlResponse({
      String? keyword, 
      String? destinationFullName, 
      String? destinationMsisdn, 
      String? currentBalance, 
      String? chargeAmount, 
      String? chargePayer, 
      String? commissionAmount, 
      dynamic commissionReceiver, 
      String? convertedAmount, 
      String? rate, 
      String? amount, 
      dynamic rewardPoint, 
      dynamic referenceId, 
      int? attemptLeft, 
      String? msisdn, 
      int? responseCode, 
      String? responseDescription, 
      dynamic responseDescriptionLocal, 
      dynamic transactionId, 
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

  AmlResponse.fromJson(dynamic json) {
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
  String? _keyword;
  String? _destinationFullName;
  String? _destinationMsisdn;
  String? _currentBalance;
  String? _chargeAmount;
  String? _chargePayer;
  String? _commissionAmount;
  dynamic _commissionReceiver;
  String? _convertedAmount;
  String? _rate;
  String? _amount;
  dynamic _rewardPoint;
  dynamic _referenceId;
  int? _attemptLeft;
  String? _msisdn;
  int? _responseCode;
  String? _responseDescription;
  dynamic _responseDescriptionLocal;
  dynamic _transactionId;
  dynamic _data;

  String? get keyword => _keyword;
  String? get destinationFullName => _destinationFullName;
  String? get destinationMsisdn => _destinationMsisdn;
  String? get currentBalance => _currentBalance;
  String? get chargeAmount => _chargeAmount;
  String? get chargePayer => _chargePayer;
  String? get commissionAmount => _commissionAmount;
  dynamic get commissionReceiver => _commissionReceiver;
  String? get convertedAmount => _convertedAmount;
  String? get rate => _rate;
  String? get amount => _amount;
  dynamic get rewardPoint => _rewardPoint;
  dynamic get referenceId => _referenceId;
  int? get attemptLeft => _attemptLeft;
  String? get msisdn => _msisdn;
  int? get responseCode => _responseCode;
  String? get responseDescription => _responseDescription;
  dynamic get responseDescriptionLocal => _responseDescriptionLocal;
  dynamic get transactionId => _transactionId;
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