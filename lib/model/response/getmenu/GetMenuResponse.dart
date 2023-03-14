/// UserFullName : "testtingagent"
/// AccCode : "A00800"
/// UserType : "Agent"
/// IsCashOut : false
/// IsSecurityQuestionSet : false
/// Latitude : "24.91617176"
/// Longitude : "88.76014519"
/// BankLinkedList : []
/// MenuDetails : [{"MenuName":"Services","SubMenu":[{"SubMenuId":2001,"SubMenuName":"Cash In","SubMenuDescription":"Load customer wallet"},{"SubMenuId":2008,"SubMenuName":"Cash Out","SubMenuDescription":"Withdraw cash from agent"}]},{"MenuName":"Reports","SubMenu":[{"SubMenuId":4001,"SubMenuName":"Balance Check","SubMenuDescription":"Check your wallet balance"}]},{"MenuName":"Agents","SubMenu":[{"SubMenuId":3001,"SubMenuName":"Create Agent","SubMenuDescription":"Register a new agent"},{"SubMenuId":3002,"SubMenuName":"Agent Balance Transfer","SubMenuDescription":"Transfer balance to agent"}]},{"MenuName":"Customer","SubMenu":[{"SubMenuId":7002,"SubMenuName":"Create/Customer Type Update","SubMenuDescription":"Update KYC of registered customer"}]}]
/// PromotionList : [{"PromotionId":null,"PromotionType":"1","PromotionImage":"Handler/PromotionImageHandler.ashx?img=feGYtOEncsuE2ZnDy73NPKGnT6oQ%2f3dQzWeFfRjPS07u%2bx%2fDV02gZkFoR88Ow8Bn","PromotionImageDetail":null,"Offer":"uat promo","Msisdn":"0","MerchantName":"Global Promotion","StartDate":"12/23/2021","ExpiryDate":"12/23/2022","Notes":"","Status":"0"},{"PromotionId":null,"PromotionType":"1","PromotionImage":"Handler/PromotionImageHandler.ashx?img=7i7QpHHqUvj%2brOjOyZOhLzxpwNlnLUgQixMU%2bb6S9aR0abCPJKJTc7uqbkDS7NFA","PromotionImageDetail":null,"Offer":"asb uat","Msisdn":"0","MerchantName":"Global Promotion","StartDate":"02/08/2022","ExpiryDate":"02/08/2023","Notes":"","Status":"0"}]
/// CheckUpdate : "6|1.0.0|true"
/// KycStatus : false
/// WalletType : 106
/// MasterWallet : 9800000110
/// IsAgentCashOut : false
/// IsSingleMerchant : false
/// IsCustomerCreate : true
/// Msisdn : "85537866093"
/// ResponseCode : 100
/// ResponseDescription : "Success"
/// ResponseDescriptionLocal : null
/// TransactionId : null
/// data : null

class GetMenuResponse {
  GetMenuResponse({
      String? userFullName, 
      String? accCode, 
      String? userType, 
      bool? isCashOut, 
      bool? isSecurityQuestionSet, 
      String? latitude, 
      String? longitude, 
      List<dynamic>? bankLinkedList, 
      List<MenuDetails>? menuDetails, 
      List<PromotionList>? promotionList, 
      String? checkUpdate, 
      bool? kycStatus, 
      int? walletType, 
      int? masterWallet, 
      bool? isAgentCashOut, 
      bool? isSingleMerchant, 
      bool? isCustomerCreate, 
      String? msisdn, 
      int? responseCode, 
      String? responseDescription, 
      dynamic responseDescriptionLocal, 
      dynamic transactionId, 
      dynamic data,}){
    _userFullName = userFullName;
    _accCode = accCode;
    _userType = userType;
    _isCashOut = isCashOut;
    _isSecurityQuestionSet = isSecurityQuestionSet;
    _latitude = latitude;
    _longitude = longitude;
    _bankLinkedList = bankLinkedList;
    _menuDetails = menuDetails;
    _promotionList = promotionList;
    _checkUpdate = checkUpdate;
    _kycStatus = kycStatus;
    _walletType = walletType;
    _masterWallet = masterWallet;
    _isAgentCashOut = isAgentCashOut;
    _isSingleMerchant = isSingleMerchant;
    _isCustomerCreate = isCustomerCreate;
    _msisdn = msisdn;
    _responseCode = responseCode;
    _responseDescription = responseDescription;
    _responseDescriptionLocal = responseDescriptionLocal;
    _transactionId = transactionId;
    _data = data;
}

  GetMenuResponse.fromJson(dynamic json) {
    _userFullName = json['UserFullName'];
    _accCode = json['AccCode'];
    _userType = json['UserType'];
    _isCashOut = json['IsCashOut'];
    _isSecurityQuestionSet = json['IsSecurityQuestionSet'];
    _latitude = json['Latitude'];
    _longitude = json['Longitude'];
    if (json['BankLinkedList'] != null) {
      _bankLinkedList = [];
      json['BankLinkedList'].forEach((v) {
        _bankLinkedList?.add(v);
      });
    }
    if (json['MenuDetails'] != null) {
      _menuDetails = [];
      json['MenuDetails'].forEach((v) {
        _menuDetails?.add(MenuDetails.fromJson(v));
      });
    }
    if (json['PromotionList'] != null) {
      _promotionList = [];
      json['PromotionList'].forEach((v) {
        _promotionList?.add(PromotionList.fromJson(v));
      });
    }
    _checkUpdate = json['CheckUpdate'];
    _kycStatus = json['KycStatus'];
    _walletType = json['WalletType'];
    _masterWallet = json['MasterWallet'];
    _isAgentCashOut = json['IsAgentCashOut'];
    _isSingleMerchant = json['IsSingleMerchant'];
    _isCustomerCreate = json['IsCustomerCreate'];
    _msisdn = json['Msisdn'];
    _responseCode = json['ResponseCode'];
    _responseDescription = json['ResponseDescription'];
    _responseDescriptionLocal = json['ResponseDescriptionLocal'];
    _transactionId = json['TransactionId'];
    _data = json['data'];
  }
  String? _userFullName;
  String? _accCode;
  String? _userType;
  bool? _isCashOut;
  bool? _isSecurityQuestionSet;
  String? _latitude;
  String? _longitude;
  List<dynamic>? _bankLinkedList;
  List<MenuDetails>? _menuDetails;
  List<PromotionList>? _promotionList;
  String? _checkUpdate;
  bool? _kycStatus;
  int? _walletType;
  int? _masterWallet;
  bool? _isAgentCashOut;
  bool? _isSingleMerchant;
  bool? _isCustomerCreate;
  String? _msisdn;
  int? _responseCode;
  String? _responseDescription;
  dynamic _responseDescriptionLocal;
  dynamic _transactionId;
  dynamic _data;

  String? get userFullName => _userFullName;
  String? get accCode => _accCode;
  String? get userType => _userType;
  bool? get isCashOut => _isCashOut;
  bool? get isSecurityQuestionSet => _isSecurityQuestionSet;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  List<dynamic>? get bankLinkedList => _bankLinkedList;
  List<MenuDetails>? get menuDetails => _menuDetails;
  List<PromotionList>? get promotionList => _promotionList;
  String? get checkUpdate => _checkUpdate;
  bool? get kycStatus => _kycStatus;
  int? get walletType => _walletType;
  int? get masterWallet => _masterWallet;
  bool? get isAgentCashOut => _isAgentCashOut;
  bool? get isSingleMerchant => _isSingleMerchant;
  bool? get isCustomerCreate => _isCustomerCreate;
  String? get msisdn => _msisdn;
  int? get responseCode => _responseCode;
  String? get responseDescription => _responseDescription;
  dynamic get responseDescriptionLocal => _responseDescriptionLocal;
  dynamic get transactionId => _transactionId;
  dynamic get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserFullName'] = _userFullName;
    map['AccCode'] = _accCode;
    map['UserType'] = _userType;
    map['IsCashOut'] = _isCashOut;
    map['IsSecurityQuestionSet'] = _isSecurityQuestionSet;
    map['Latitude'] = _latitude;
    map['Longitude'] = _longitude;
    if (_bankLinkedList != null) {
      map['BankLinkedList'] = _bankLinkedList?.map((v) => v.toJson()).toList();
    }
    if (_menuDetails != null) {
      map['MenuDetails'] = _menuDetails?.map((v) => v.toJson()).toList();
    }
    if (_promotionList != null) {
      map['PromotionList'] = _promotionList?.map((v) => v.toJson()).toList();
    }
    map['CheckUpdate'] = _checkUpdate;
    map['KycStatus'] = _kycStatus;
    map['WalletType'] = _walletType;
    map['MasterWallet'] = _masterWallet;
    map['IsAgentCashOut'] = _isAgentCashOut;
    map['IsSingleMerchant'] = _isSingleMerchant;
    map['IsCustomerCreate'] = _isCustomerCreate;
    map['Msisdn'] = _msisdn;
    map['ResponseCode'] = _responseCode;
    map['ResponseDescription'] = _responseDescription;
    map['ResponseDescriptionLocal'] = _responseDescriptionLocal;
    map['TransactionId'] = _transactionId;
    map['data'] = _data;
    return map;
  }

}

/// PromotionId : null
/// PromotionType : "1"
/// PromotionImage : "Handler/PromotionImageHandler.ashx?img=feGYtOEncsuE2ZnDy73NPKGnT6oQ%2f3dQzWeFfRjPS07u%2bx%2fDV02gZkFoR88Ow8Bn"
/// PromotionImageDetail : null
/// Offer : "uat promo"
/// Msisdn : "0"
/// MerchantName : "Global Promotion"
/// StartDate : "12/23/2021"
/// ExpiryDate : "12/23/2022"
/// Notes : ""
/// Status : "0"

class PromotionList {
  PromotionList({
      dynamic promotionId, 
      String? promotionType, 
      String? promotionImage, 
      dynamic promotionImageDetail, 
      String? offer, 
      String? msisdn, 
      String? merchantName, 
      String? startDate, 
      String? expiryDate, 
      String? notes, 
      String? status,}){
    _promotionId = promotionId;
    _promotionType = promotionType;
    _promotionImage = promotionImage;
    _promotionImageDetail = promotionImageDetail;
    _offer = offer;
    _msisdn = msisdn;
    _merchantName = merchantName;
    _startDate = startDate;
    _expiryDate = expiryDate;
    _notes = notes;
    _status = status;
}

  PromotionList.fromJson(dynamic json) {
    _promotionId = json['PromotionId'];
    _promotionType = json['PromotionType'];
    _promotionImage = json['PromotionImage'];
    _promotionImageDetail = json['PromotionImageDetail'];
    _offer = json['Offer'];
    _msisdn = json['Msisdn'];
    _merchantName = json['MerchantName'];
    _startDate = json['StartDate'];
    _expiryDate = json['ExpiryDate'];
    _notes = json['Notes'];
    _status = json['Status'];
  }
  dynamic _promotionId;
  String? _promotionType;
  String? _promotionImage;
  dynamic _promotionImageDetail;
  String? _offer;
  String? _msisdn;
  String? _merchantName;
  String? _startDate;
  String? _expiryDate;
  String? _notes;
  String? _status;

  dynamic get promotionId => _promotionId;
  String? get promotionType => _promotionType;
  String? get promotionImage => _promotionImage;
  dynamic get promotionImageDetail => _promotionImageDetail;
  String? get offer => _offer;
  String? get msisdn => _msisdn;
  String? get merchantName => _merchantName;
  String? get startDate => _startDate;
  String? get expiryDate => _expiryDate;
  String? get notes => _notes;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PromotionId'] = _promotionId;
    map['PromotionType'] = _promotionType;
    map['PromotionImage'] = _promotionImage;
    map['PromotionImageDetail'] = _promotionImageDetail;
    map['Offer'] = _offer;
    map['Msisdn'] = _msisdn;
    map['MerchantName'] = _merchantName;
    map['StartDate'] = _startDate;
    map['ExpiryDate'] = _expiryDate;
    map['Notes'] = _notes;
    map['Status'] = _status;
    return map;
  }

}

/// MenuName : "Services"
/// SubMenu : [{"SubMenuId":2001,"SubMenuName":"Cash In","SubMenuDescription":"Load customer wallet"},{"SubMenuId":2008,"SubMenuName":"Cash Out","SubMenuDescription":"Withdraw cash from agent"}]

class MenuDetails {
  MenuDetails({
      String? menuName, 
      List<SubMenu>? subMenu,}){
    _menuName = menuName;
    _subMenu = subMenu;
}

  MenuDetails.fromJson(dynamic json) {
    _menuName = json['MenuName'];
    if (json['SubMenu'] != null) {
      _subMenu = [];
      json['SubMenu'].forEach((v) {
        _subMenu?.add(SubMenu.fromJson(v));
      });
    }
  }
  String? _menuName;
  List<SubMenu>? _subMenu;

  String? get menuName => _menuName;
  List<SubMenu>? get subMenu => _subMenu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['MenuName'] = _menuName;
    if (_subMenu != null) {
      map['SubMenu'] = _subMenu?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// SubMenuId : 2001
/// SubMenuName : "Cash In"
/// SubMenuDescription : "Load customer wallet"

class SubMenu {
  SubMenu({
      int? subMenuId, 
      String? subMenuName, 
      String? subMenuDescription,}){
    _subMenuId = subMenuId;
    _subMenuName = subMenuName;
    _subMenuDescription = subMenuDescription;
}

  SubMenu.fromJson(dynamic json) {
    _subMenuId = json['SubMenuId'];
    _subMenuName = json['SubMenuName'];
    _subMenuDescription = json['SubMenuDescription'];
  }
  int? _subMenuId;
  String? _subMenuName;
  String? _subMenuDescription;

  int? get subMenuId => _subMenuId;
  String? get subMenuName => _subMenuName;
  String? get subMenuDescription => _subMenuDescription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['SubMenuId'] = _subMenuId;
    map['SubMenuName'] = _subMenuName;
    map['SubMenuDescription'] = _subMenuDescription;
    return map;
  }

}