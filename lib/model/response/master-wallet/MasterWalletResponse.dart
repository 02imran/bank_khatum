/// Msisdn : 9800000110
/// WalletName : "Master Wallet"


class MasterWalletResponse {
  MasterWalletResponse({
      int? msisdn, 
      String? walletName,}){
    _msisdn = msisdn;
    _walletName = walletName;
}

  MasterWalletResponse.fromJson(dynamic json) {
    _msisdn = json['Msisdn'];
    _walletName = json['WalletName'];
  }
  int? _msisdn;
  String? _walletName;

  int? get msisdn => _msisdn;
  String? get walletName => _walletName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Msisdn'] = _msisdn;
    map['WalletName'] = _walletName;
    return map;
  }

}