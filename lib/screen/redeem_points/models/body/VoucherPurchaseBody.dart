/// Keyword : "VPMT"
/// Source_Wallet_ID : "17670814134"
/// Dest_Wallet_ID : "600008817670814133"
/// Amount : "10"
/// Transaction_Fee : "1"
/// Transaction_Comm : "1"
/// Charge_Payer : 1
/// Currency : "XCD"
/// Reference_ID : "PD00203"
/// Comission_Receiver : 0

class VoucherPurchaseBody {
  VoucherPurchaseBody({
      String? keyword, 
      String? sourceWalletID, 
      String? destWalletID, 
      String? amount, 
      String? transactionFee, 
      String? transactionComm, 
      num? chargePayer, 
      String? currency, 
      String? referenceID, 
      num? comissionReceiver,}){
    _keyword = keyword;
    _sourceWalletID = sourceWalletID;
    _destWalletID = destWalletID;
    _amount = amount;
    _transactionFee = transactionFee;
    _transactionComm = transactionComm;
    _chargePayer = chargePayer;
    _currency = currency;
    _referenceID = referenceID;
    _comissionReceiver = comissionReceiver;
}

  VoucherPurchaseBody.fromJson(dynamic json) {
    _keyword = json['Keyword'];
    _sourceWalletID = json['Source_Wallet_ID'];
    _destWalletID = json['Dest_Wallet_ID'];
    _amount = json['Amount'];
    _transactionFee = json['Transaction_Fee'];
    _transactionComm = json['Transaction_Comm'];
    _chargePayer = json['Charge_Payer'];
    _currency = json['Currency'];
    _referenceID = json['Reference_ID'];
    _comissionReceiver = json['Comission_Receiver'];
  }
  String? _keyword;
  String? _sourceWalletID;
  String? _destWalletID;
  String? _amount;
  String? _transactionFee;
  String? _transactionComm;
  num? _chargePayer;
  String? _currency;
  String? _referenceID;
  num? _comissionReceiver;
VoucherPurchaseBody copyWith({  String? keyword,
  String? sourceWalletID,
  String? destWalletID,
  String? amount,
  String? transactionFee,
  String? transactionComm,
  num? chargePayer,
  String? currency,
  String? referenceID,
  num? comissionReceiver,
}) => VoucherPurchaseBody(  keyword: keyword ?? _keyword,
  sourceWalletID: sourceWalletID ?? _sourceWalletID,
  destWalletID: destWalletID ?? _destWalletID,
  amount: amount ?? _amount,
  transactionFee: transactionFee ?? _transactionFee,
  transactionComm: transactionComm ?? _transactionComm,
  chargePayer: chargePayer ?? _chargePayer,
  currency: currency ?? _currency,
  referenceID: referenceID ?? _referenceID,
  comissionReceiver: comissionReceiver ?? _comissionReceiver,
);
  String? get keyword => _keyword;
  String? get sourceWalletID => _sourceWalletID;
  String? get destWalletID => _destWalletID;
  String? get amount => _amount;
  String? get transactionFee => _transactionFee;
  String? get transactionComm => _transactionComm;
  num? get chargePayer => _chargePayer;
  String? get currency => _currency;
  String? get referenceID => _referenceID;
  num? get comissionReceiver => _comissionReceiver;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Keyword'] = _keyword;
    map['Source_Wallet_ID'] = _sourceWalletID;
    map['Dest_Wallet_ID'] = _destWalletID;
    map['Amount'] = _amount;
    map['Transaction_Fee'] = _transactionFee;
    map['Transaction_Comm'] = _transactionComm;
    map['Charge_Payer'] = _chargePayer;
    map['Currency'] = _currency;
    map['Reference_ID'] = _referenceID;
    map['Comission_Receiver'] = _comissionReceiver;
    return map;
  }

}