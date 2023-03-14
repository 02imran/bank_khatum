/// ResponseCode : 100
/// ResponseDescription : "Success"
/// ResponseData : {"Msisdn":85512228887,"UserFullName":"aeon2 test2","AccCode":"CS1009100","UserType":"Customer","IsCashOut":false,"IsSecurityQuestionSet":true,"Latitude":null,"Longitude":null,"KycStatus":false,"WalletType":111,"MasterWallet":0,"CheckUpdate":"10|1.0.0|true","BankLinkedList":[],"Tabs":[{"MenuName":"Events","MenuNameNp":"ព្រឹត្តិការណ៍","MenuItems":[],"OfferUrls":null,"OfferImages":[{"Link":"Handler/PromotionImageHandler.ashx?img=feGYtOEncsuE2ZnDy73NPKGnT6oQ%2f3dQzWeFfRjPS07u%2bx%2fDV02gZkFoR88Ow8Bn","ExtraText":""}]},{"MenuName":"Utility","MenuNameNp":"Utility","MenuItems":[{"ItemId":"5000","ItemName":"Merchants","ItemNameLocal":"Merchants","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5001","ItemName":"Eats","ItemNameLocal":"Eats","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5002","ItemName":"Travels","ItemNameLocal":"Travels","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5003","ItemName":"Classifieds","ItemNameLocal":"Classifieds","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5004","ItemName":"Entertainment","ItemNameLocal":"Entertainment","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5005","ItemName":"Gifts & Donations","ItemNameLocal":"Gifts & Donations","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5006","ItemName":"Professional Services","ItemNameLocal":"Professional Services","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5007","ItemName":"Finance","ItemNameLocal":"Finance","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5008","ItemName":"Tourism & Hospitality","ItemNameLocal":"Tourism & Hospitality","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5009","ItemName":"Non Profits","ItemNameLocal":"Non Profits","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5010","ItemName":"Public Sector","ItemNameLocal":"Public Sector","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5011","ItemName":"Top up & Bill Payment","ItemNameLocal":"Top up & Bill Payment","IsActive":true,"ExtraText":"","ExtraTextLocal":null}],"OfferUrls":null,"OfferImages":[]}],"NonLinkedBankList":[],"AllBankList":[],"FullScreenPromotion":[],"PromotionList":[{"PromotionId":null,"PromotionType":"1","PromotionImage":"Handler/PromotionImageHandler.ashx?img=feGYtOEncsuE2ZnDy73NPKGnT6oQ%2f3dQzWeFfRjPS07u%2bx%2fDV02gZkFoR88Ow8Bn","PromotionImageDetail":null,"Offer":"uat promo","Msisdn":"0","MerchantName":"Global Promotion","StartDate":"12/23/2021","ExpiryDate":"12/23/2022","Notes":"","Status":"0"}],"TelecomOperator":[]}

class GetCustomerMenuResponse {
  GetCustomerMenuResponse({
      int? responseCode, 
      String? responseDescription, 
      ResponseData? responseData,}){
    _responseCode = responseCode;
    _responseDescription = responseDescription;
    _responseData = responseData;
}

  GetCustomerMenuResponse.fromJson(dynamic json) {
    _responseCode = json['ResponseCode'];
    _responseDescription = json['ResponseDescription'];
    _responseData = json['ResponseData'] != null ? ResponseData.fromJson(json['ResponseData']) : null;
  }
  int? _responseCode;
  String? _responseDescription;
  ResponseData? _responseData;

  int? get responseCode => _responseCode;
  String? get responseDescription => _responseDescription;
  ResponseData? get responseData => _responseData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ResponseCode'] = _responseCode;
    map['ResponseDescription'] = _responseDescription;
    if (_responseData != null) {
      map['ResponseData'] = _responseData?.toJson();
    }
    return map;
  }

}

/// Msisdn : 85512228887
/// UserFullName : "aeon2 test2"
/// AccCode : "CS1009100"
/// UserType : "Customer"
/// IsCashOut : false
/// IsSecurityQuestionSet : true
/// Latitude : null
/// Longitude : null
/// KycStatus : false
/// WalletType : 111
/// MasterWallet : 0
/// CheckUpdate : "10|1.0.0|true"
/// BankLinkedList : []
/// Tabs : [{"MenuName":"Events","MenuNameNp":"ព្រឹត្តិការណ៍","MenuItems":[],"OfferUrls":null,"OfferImages":[{"Link":"Handler/PromotionImageHandler.ashx?img=feGYtOEncsuE2ZnDy73NPKGnT6oQ%2f3dQzWeFfRjPS07u%2bx%2fDV02gZkFoR88Ow8Bn","ExtraText":""}]},{"MenuName":"Utility","MenuNameNp":"Utility","MenuItems":[{"ItemId":"5000","ItemName":"Merchants","ItemNameLocal":"Merchants","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5001","ItemName":"Eats","ItemNameLocal":"Eats","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5002","ItemName":"Travels","ItemNameLocal":"Travels","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5003","ItemName":"Classifieds","ItemNameLocal":"Classifieds","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5004","ItemName":"Entertainment","ItemNameLocal":"Entertainment","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5005","ItemName":"Gifts & Donations","ItemNameLocal":"Gifts & Donations","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5006","ItemName":"Professional Services","ItemNameLocal":"Professional Services","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5007","ItemName":"Finance","ItemNameLocal":"Finance","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5008","ItemName":"Tourism & Hospitality","ItemNameLocal":"Tourism & Hospitality","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5009","ItemName":"Non Profits","ItemNameLocal":"Non Profits","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5010","ItemName":"Public Sector","ItemNameLocal":"Public Sector","IsActive":true,"ExtraText":"","ExtraTextLocal":null},{"ItemId":"5011","ItemName":"Top up & Bill Payment","ItemNameLocal":"Top up & Bill Payment","IsActive":true,"ExtraText":"","ExtraTextLocal":null}],"OfferUrls":null,"OfferImages":[]}]
/// NonLinkedBankList : []
/// AllBankList : []
/// FullScreenPromotion : []
/// PromotionList : [{"PromotionId":null,"PromotionType":"1","PromotionImage":"Handler/PromotionImageHandler.ashx?img=feGYtOEncsuE2ZnDy73NPKGnT6oQ%2f3dQzWeFfRjPS07u%2bx%2fDV02gZkFoR88Ow8Bn","PromotionImageDetail":null,"Offer":"uat promo","Msisdn":"0","MerchantName":"Global Promotion","StartDate":"12/23/2021","ExpiryDate":"12/23/2022","Notes":"","Status":"0"}]
/// TelecomOperator : []

class ResponseData {
  ResponseData({
      int? msisdn, 
      String? userFullName, 
      String? accCode, 
      String? userType, 
      bool? isCashOut, 
      bool? isSecurityQuestionSet, 
      dynamic latitude, 
      dynamic longitude, 
      bool? kycStatus, 
      int? walletType, 
      int? masterWallet, 
      String? checkUpdate, 
      List<dynamic>? bankLinkedList, 
      List<Tabs>? tabs, 
      List<dynamic>? nonLinkedBankList, 
      List<dynamic>? allBankList, 
      List<dynamic>? fullScreenPromotion, 
      List<PromotionList>? promotionList, 
      List<dynamic>? telecomOperator,}){
    _msisdn = msisdn;
    _userFullName = userFullName;
    _accCode = accCode;
    _userType = userType;
    _isCashOut = isCashOut;
    _isSecurityQuestionSet = isSecurityQuestionSet;
    _latitude = latitude;
    _longitude = longitude;
    _kycStatus = kycStatus;
    _walletType = walletType;
    _masterWallet = masterWallet;
    _checkUpdate = checkUpdate;
    _bankLinkedList = bankLinkedList;
    _tabs = tabs;
    _nonLinkedBankList = nonLinkedBankList;
    _allBankList = allBankList;
    _fullScreenPromotion = fullScreenPromotion;
    _promotionList = promotionList;
    _telecomOperator = telecomOperator;
}

  ResponseData.fromJson(dynamic json) {
    _msisdn = json['Msisdn'];
    _userFullName = json['UserFullName'];
    _accCode = json['AccCode'];
    _userType = json['UserType'];
    _isCashOut = json['IsCashOut'];
    _isSecurityQuestionSet = json['IsSecurityQuestionSet'];
    _latitude = json['Latitude'];
    _longitude = json['Longitude'];
    _kycStatus = json['KycStatus'];
    _walletType = json['WalletType'];
    _masterWallet = json['MasterWallet'];
    _checkUpdate = json['CheckUpdate'];
    if (json['BankLinkedList'] != null) {
      _bankLinkedList = [];
      json['BankLinkedList'].forEach((v) {
        _bankLinkedList?.add(v);
      });
    }
    if (json['Tabs'] != null) {
      _tabs = [];
      json['Tabs'].forEach((v) {
        _tabs?.add(Tabs.fromJson(v));
      });
    }
    if (json['NonLinkedBankList'] != null) {
      _nonLinkedBankList = [];
      json['NonLinkedBankList'].forEach((v) {
        _nonLinkedBankList?.add(v);
      });
    }
    if (json['AllBankList'] != null) {
      _allBankList = [];
      json['AllBankList'].forEach((v) {
        _allBankList?.add(v);
      });
    }
    if (json['FullScreenPromotion'] != null) {
      _fullScreenPromotion = [];
      json['FullScreenPromotion'].forEach((v) {
        _fullScreenPromotion?.add(v);
      });
    }
    if (json['PromotionList'] != null) {
      _promotionList = [];
      json['PromotionList'].forEach((v) {
        _promotionList?.add(PromotionList.fromJson(v));
      });
    }
    if (json['TelecomOperator'] != null) {
      _telecomOperator = [];
      json['TelecomOperator'].forEach((v) {
        _telecomOperator?.add(v);
      });
    }
  }
  int? _msisdn;
  String? _userFullName;
  String? _accCode;
  String? _userType;
  bool? _isCashOut;
  bool? _isSecurityQuestionSet;
  dynamic _latitude;
  dynamic _longitude;
  bool? _kycStatus;
  int? _walletType;
  int? _masterWallet;
  String? _checkUpdate;
  List<dynamic>? _bankLinkedList;
  List<Tabs>? _tabs;
  List<dynamic>? _nonLinkedBankList;
  List<dynamic>? _allBankList;
  List<dynamic>? _fullScreenPromotion;
  List<PromotionList>? _promotionList;
  List<dynamic>? _telecomOperator;

  int? get msisdn => _msisdn;
  String? get userFullName => _userFullName;
  String? get accCode => _accCode;
  String? get userType => _userType;
  bool? get isCashOut => _isCashOut;
  bool? get isSecurityQuestionSet => _isSecurityQuestionSet;
  dynamic get latitude => _latitude;
  dynamic get longitude => _longitude;
  bool? get kycStatus => _kycStatus;
  int? get walletType => _walletType;
  int? get masterWallet => _masterWallet;
  String? get checkUpdate => _checkUpdate;
  List<dynamic>? get bankLinkedList => _bankLinkedList;
  List<Tabs>? get tabs => _tabs;
  List<dynamic>? get nonLinkedBankList => _nonLinkedBankList;
  List<dynamic>? get allBankList => _allBankList;
  List<dynamic>? get fullScreenPromotion => _fullScreenPromotion;
  List<PromotionList>? get promotionList => _promotionList;
  List<dynamic>? get telecomOperator => _telecomOperator;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Msisdn'] = _msisdn;
    map['UserFullName'] = _userFullName;
    map['AccCode'] = _accCode;
    map['UserType'] = _userType;
    map['IsCashOut'] = _isCashOut;
    map['IsSecurityQuestionSet'] = _isSecurityQuestionSet;
    map['Latitude'] = _latitude;
    map['Longitude'] = _longitude;
    map['KycStatus'] = _kycStatus;
    map['WalletType'] = _walletType;
    map['MasterWallet'] = _masterWallet;
    map['CheckUpdate'] = _checkUpdate;
    if (_bankLinkedList != null) {
      map['BankLinkedList'] = _bankLinkedList?.map((v) => v.toJson()).toList();
    }
    if (_tabs != null) {
      map['Tabs'] = _tabs?.map((v) => v.toJson()).toList();
    }
    if (_nonLinkedBankList != null) {
      map['NonLinkedBankList'] = _nonLinkedBankList?.map((v) => v.toJson()).toList();
    }
    if (_allBankList != null) {
      map['AllBankList'] = _allBankList?.map((v) => v.toJson()).toList();
    }
    if (_fullScreenPromotion != null) {
      map['FullScreenPromotion'] = _fullScreenPromotion?.map((v) => v.toJson()).toList();
    }
    if (_promotionList != null) {
      map['PromotionList'] = _promotionList?.map((v) => v.toJson()).toList();
    }
    if (_telecomOperator != null) {
      map['TelecomOperator'] = _telecomOperator?.map((v) => v.toJson()).toList();
    }
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

/// MenuName : "Events"
/// MenuNameNp : "ព្រឹត្តិការណ៍"
/// MenuItems : []
/// OfferUrls : null
/// OfferImages : [{"Link":"Handler/PromotionImageHandler.ashx?img=feGYtOEncsuE2ZnDy73NPKGnT6oQ%2f3dQzWeFfRjPS07u%2bx%2fDV02gZkFoR88Ow8Bn","ExtraText":""}]

class Tabs {
  Tabs({
      String? menuName, 
      String? menuNameNp, 
      List<MenuItems>? menuItems,
      dynamic offerUrls, 
      List<OfferImages>? offerImages,}){
    _menuName = menuName;
    _menuNameNp = menuNameNp;
    _menuItems = menuItems;
    _offerUrls = offerUrls;
    _offerImages = offerImages;
}

  Tabs.fromJson(dynamic json) {
    _menuName = json['MenuName'];
    _menuNameNp = json['MenuNameNp'];
    if (json['MenuItems'] != null) {
      _menuItems = [];
      json['MenuItems'].forEach((v) {
        _menuItems?.add(MenuItems.fromJson(v));
      });
    }
    _offerUrls = json['OfferUrls'];
    if (json['OfferImages'] != null) {
      _offerImages = [];
      json['OfferImages'].forEach((v) {
        _offerImages?.add(OfferImages.fromJson(v));
      });
    }
  }
  String? _menuName;
  String? _menuNameNp;
  List<MenuItems>? _menuItems;
  dynamic _offerUrls;
  List<OfferImages>? _offerImages;

  String? get menuName => _menuName;
  String? get menuNameNp => _menuNameNp;
  List<MenuItems>? get menuItems => _menuItems;
  dynamic get offerUrls => _offerUrls;
  List<OfferImages>? get offerImages => _offerImages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['MenuName'] = _menuName;
    map['MenuNameNp'] = _menuNameNp;
    if (_menuItems != null) {
      map['MenuItems'] = _menuItems?.map((v) => v.toJson()).toList();
    }
    map['OfferUrls'] = _offerUrls;
    if (_offerImages != null) {
      map['OfferImages'] = _offerImages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Link : "Handler/PromotionImageHandler.ashx?img=feGYtOEncsuE2ZnDy73NPKGnT6oQ%2f3dQzWeFfRjPS07u%2bx%2fDV02gZkFoR88Ow8Bn"
/// ExtraText : ""

class OfferImages {
  OfferImages({
      String? link, 
      String? extraText,}){
    _link = link;
    _extraText = extraText;
}

  OfferImages.fromJson(dynamic json) {
    _link = json['Link'];
    _extraText = json['ExtraText'];
  }
  String? _link;
  String? _extraText;

  String? get link => _link;
  String? get extraText => _extraText;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Link'] = _link;
    map['ExtraText'] = _extraText;
    return map;
  }

}

class MenuItems {
  MenuItems({
    String? itemId,
    String? itemName,
    String? itemNameLocal,
    bool? isActive,
    String? extraText,
    dynamic extraTextLocal,}){
    _itemId = itemId;
    _itemName = itemName;
    _itemNameLocal = itemNameLocal;
    _isActive = isActive;
    _extraText = extraText;
    _extraTextLocal = extraTextLocal;
  }

  MenuItems.fromJson(dynamic json) {
    _itemId = json['ItemId'];
    _itemName = json['ItemName'];
    _itemNameLocal = json['ItemNameLocal'];
    _isActive = json['IsActive'];
    _extraText = json['ExtraText'];
    _extraTextLocal = json['ExtraTextLocal'];
  }
  String? _itemId;
  String? _itemName;
  String? _itemNameLocal;
  bool? _isActive;
  String? _extraText;
  dynamic _extraTextLocal;

  String? get itemId => _itemId;
  String? get itemName => _itemName;
  String? get itemNameLocal => _itemNameLocal;
  bool? get isActive => _isActive;
  String? get extraText => _extraText;
  dynamic get extraTextLocal => _extraTextLocal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ItemId'] = _itemId;
    map['ItemName'] = _itemName;
    map['ItemNameLocal'] = _itemNameLocal;
    map['IsActive'] = _isActive;
    map['ExtraText'] = _extraText;
    map['ExtraTextLocal'] = _extraTextLocal;
    return map;
  }

}