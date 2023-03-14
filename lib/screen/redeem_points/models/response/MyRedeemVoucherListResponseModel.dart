/// payload : {"discount":[{"Id":"120225","VoucherType":"discount","VoucherId":"PD00179","PurchaseAt":"2022-04-25T08:59:48.923Z","Voucher":{"MerchantId":"40000881000000028","VoucherImage":"http://3.18.0.201:9000/voucher-images/Voucher-Image-1650797249274.jpeg","VoucherValidity":"5","VoucherValue":1,"ProductId":"null","MinExpAmount":500,"RewardPoint":7}},{"Id":"120226","VoucherType":"discount","VoucherId":"PD00179","PurchaseAt":"2022-04-25T09:17:41.983Z","Voucher":{"MerchantId":"40000881000000028","VoucherImage":"http://3.18.0.201:9000/voucher-images/Voucher-Image-1650797249274.jpeg","VoucherValidity":"5","VoucherValue":1,"ProductId":"null","MinExpAmount":500,"RewardPoint":7}},{"Id":"120229","VoucherType":"discount","VoucherId":"PD00179","PurchaseAt":"2022-04-26T04:57:56.467Z","Voucher":{"MerchantId":"40000881000000028","VoucherImage":"http://3.18.0.201:9000/voucher-images/Voucher-Image-1650797249274.jpeg","VoucherValidity":"5","VoucherValue":1,"ProductId":"null","MinExpAmount":500,"RewardPoint":7}},{"Id":"120230","VoucherType":"discount","VoucherId":"PD00181","PurchaseAt":"2022-04-26T04:58:09.630Z","Voucher":{"MerchantId":"40000881000000030","VoucherImage":"http://3.18.0.201:9000/voucher-images/Voucher-Image-1650948929480.png","VoucherValidity":"5","VoucherValue":1,"ProductId":"null","MinExpAmount":4,"RewardPoint":45}}],"product":[{"Id":"120228","VoucherType":"product","VoucherId":"PD00180","PurchaseAt":"2022-04-26T04:57:41.483Z","Voucher":{"MerchantId":"40000881000000030","VoucherImage":"http://3.18.0.201:9000/voucher-images/Voucher-Image-1650948840243.jpeg","VoucherValidity":"4","VoucherValue":3,"ProductId":"1637495199169","MinExpAmount":34,"RewardPoint":3}}],"cash":[{"Id":"120231","VoucherType":"cash","VoucherId":"PD00182","PurchaseAt":"2022-04-26T04:58:30.560Z","Voucher":{"MerchantId":"40000881000000030","VoucherImage":"http://3.18.0.201:9000/voucher-images/Voucher-Image-1650949001836.png","VoucherValidity":"4","VoucherValue":1,"ProductId":"null","MinExpAmount":3,"RewardPoint":4}}]}
/// message : "The request has succeeded"

class MyRedeemVoucherListResponseModel {
  MyRedeemVoucherListResponseModel({
      Payload? payload, 
      String? message,}){
    _payload = payload;
    _message = message;
}

  MyRedeemVoucherListResponseModel.fromJson(dynamic json) {
    _payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
    _message = json['message'];
  }
  Payload? _payload;
  String? _message;

  Payload? get payload => _payload;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_payload != null) {
      map['payload'] = _payload?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// discount : [{"Id":"120225","VoucherType":"discount","VoucherId":"PD00179","PurchaseAt":"2022-04-25T08:59:48.923Z","Voucher":{"MerchantId":"40000881000000028","VoucherImage":"http://3.18.0.201:9000/voucher-images/Voucher-Image-1650797249274.jpeg","VoucherValidity":"5","VoucherValue":1,"ProductId":"null","MinExpAmount":500,"RewardPoint":7}},{"Id":"120226","VoucherType":"discount","VoucherId":"PD00179","PurchaseAt":"2022-04-25T09:17:41.983Z","Voucher":{"MerchantId":"40000881000000028","VoucherImage":"http://3.18.0.201:9000/voucher-images/Voucher-Image-1650797249274.jpeg","VoucherValidity":"5","VoucherValue":1,"ProductId":"null","MinExpAmount":500,"RewardPoint":7}},{"Id":"120229","VoucherType":"discount","VoucherId":"PD00179","PurchaseAt":"2022-04-26T04:57:56.467Z","Voucher":{"MerchantId":"40000881000000028","VoucherImage":"http://3.18.0.201:9000/voucher-images/Voucher-Image-1650797249274.jpeg","VoucherValidity":"5","VoucherValue":1,"ProductId":"null","MinExpAmount":500,"RewardPoint":7}},{"Id":"120230","VoucherType":"discount","VoucherId":"PD00181","PurchaseAt":"2022-04-26T04:58:09.630Z","Voucher":{"MerchantId":"40000881000000030","VoucherImage":"http://3.18.0.201:9000/voucher-images/Voucher-Image-1650948929480.png","VoucherValidity":"5","VoucherValue":1,"ProductId":"null","MinExpAmount":4,"RewardPoint":45}}]
/// product : [{"Id":"120228","VoucherType":"product","VoucherId":"PD00180","PurchaseAt":"2022-04-26T04:57:41.483Z","Voucher":{"MerchantId":"40000881000000030","VoucherImage":"http://3.18.0.201:9000/voucher-images/Voucher-Image-1650948840243.jpeg","VoucherValidity":"4","VoucherValue":3,"ProductId":"1637495199169","MinExpAmount":34,"RewardPoint":3}}]
/// cash : [{"Id":"120231","VoucherType":"cash","VoucherId":"PD00182","PurchaseAt":"2022-04-26T04:58:30.560Z","Voucher":{"MerchantId":"40000881000000030","VoucherImage":"http://3.18.0.201:9000/voucher-images/Voucher-Image-1650949001836.png","VoucherValidity":"4","VoucherValue":1,"ProductId":"null","MinExpAmount":3,"RewardPoint":4}}]

class Payload {
  Payload({
      List<MyRedeemVoucherInfo>? discount,
      List<MyRedeemVoucherInfo>? product,
      List<MyRedeemVoucherInfo>? cash,}){
    _discount = discount;
    _product = product;
    _cash = cash;
}

  Payload.fromJson(dynamic json) {
    if (json['discount'] != null) {
      _discount = [];
      json['discount'].forEach((v) {
        _discount?.add(MyRedeemVoucherInfo.fromJson(v));
      });
    }
    if (json['product'] != null) {
      _product = [];
      json['product'].forEach((v) {
        _product?.add(MyRedeemVoucherInfo.fromJson(v));
      });
    }
    if (json['cash'] != null) {
      _cash = [];
      json['cash'].forEach((v) {
        _cash?.add(MyRedeemVoucherInfo.fromJson(v));
      });
    }
  }
  List<MyRedeemVoucherInfo>? _discount;
  List<MyRedeemVoucherInfo>? _product;
  List<MyRedeemVoucherInfo>? _cash;

  List<MyRedeemVoucherInfo>? get discount => _discount;
  List<MyRedeemVoucherInfo>? get product => _product;
  List<MyRedeemVoucherInfo>? get cash => _cash;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_discount != null) {
      map['discount'] = _discount?.map((v) => v.toJson()).toList();
    }
    if (_product != null) {
      map['product'] = _product?.map((v) => v.toJson()).toList();
    }
    if (_cash != null) {
      map['cash'] = _cash?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Id : "120231"
/// VoucherType : "cash"
/// VoucherId : "PD00182"
/// PurchaseAt : "2022-04-26T04:58:30.560Z"
/// Voucher : {"MerchantId":"40000881000000030","VoucherImage":"http://3.18.0.201:9000/voucher-images/Voucher-Image-1650949001836.png","VoucherValidity":"4","VoucherValue":1,"ProductId":"null","MinExpAmount":3,"RewardPoint":4}

class MyRedeemVoucherInfo {
  MyRedeemVoucherInfo({
      String? id, 
      String? voucherType, 
      String? voucherId, 
      String? purchaseAt,
      String? voucherImage,
    VoucherInfo? voucher,}){
    _id = id;
    _voucherType = voucherType;
    _voucherId = voucherId;
    _purchaseAt = purchaseAt;
    _voucher = voucher;
    _voucherImage = voucherImage;
}

  MyRedeemVoucherInfo.fromJson(dynamic json) {
    _id = json['Id'];
    _voucherType = json['VoucherType'];
    _voucherId = json['VoucherId'];
    _purchaseAt = json['PurchaseAt'];
    _voucherImage = json['VoucherImage'];
    _voucher = json['Voucher'] != null ? VoucherInfo.fromJson(json['Voucher']) : null;
  }
  String? _id;
  String? _voucherType;
  String? _voucherId;
  String? _purchaseAt;
  String? _voucherImage;
  VoucherInfo? _voucher;

  String? get id => _id;
  String? get voucherType => _voucherType;
  String? get voucherId => _voucherId;
  String? get purchaseAt => _purchaseAt;
  String? get voucherImage => _voucherImage;
  VoucherInfo? get voucher => _voucher;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['VoucherType'] = _voucherType;
    map['VoucherId'] = _voucherId;
    map['PurchaseAt'] = _purchaseAt;
    map['VoucherImage'] = _voucherImage;
    if (_voucher != null) {
      map['Voucher'] = _voucher?.toJson();
    }
    return map;
  }

}




/// MerchantId : "40000881000000030"
/// VoucherImage : "http://3.18.0.201:9000/voucher-images/Voucher-Image-1650949001836.png"
/// VoucherValidity : "4"
/// VoucherValue : 1
/// ProductId : "null"
/// MinExpAmount : 3
/// RewardPoint : 4

class VoucherInfo {
  VoucherInfo({
    String? tier,
    String? terms,
    String? description,
    String? merchantId,
    String? voucherImage,
    String? voucherValidity,
    int? voucherValue,
    String? productId,
    int? minExpAmount,
    int? rewardPoint,}){
    _tier = tier;
    _terms = terms;
    _description = description;
    _merchantId = merchantId;
    _voucherImage = voucherImage;
    _voucherValidity = voucherValidity;
    _voucherValue = voucherValue;
    _productId = productId;
    _minExpAmount = minExpAmount;
    _rewardPoint = rewardPoint;
  }

  VoucherInfo.fromJson(dynamic json) {
    _tier = json['Tier'];
    _terms = json['Terms'];
    _description = json['Description'];
    _merchantId = json['MerchantId'];
    _voucherImage = json['VoucherImage'];
    _voucherValidity = json['VoucherValidity'];
    _voucherValue = json['VoucherValue'];
    _productId = json['ProductId'];
    _minExpAmount = json['MinExpAmount'];
    _rewardPoint = json['RewardPoint'];
  }
  String? _tier;
  String? _terms;
  String? _description;
  String? _merchantId;
  String? _voucherImage;
  String? _voucherValidity;
  int? _voucherValue;
  String? _productId;
  int? _minExpAmount;
  int? _rewardPoint;

  String? get tier => _tier;
  String? get terms => _terms;
  String? get description => _description;
  String? get merchantId => _merchantId;
  String? get voucherImage => _voucherImage;
  String? get voucherValidity => _voucherValidity;
  int? get voucherValue => _voucherValue;
  String? get productId => _productId;
  int? get minExpAmount => _minExpAmount;
  int? get rewardPoint => _rewardPoint;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Tier'] = _tier;
    map['Terms'] = _terms;
    map['Description'] = _description;
    map['MerchantId'] = _merchantId;
    map['VoucherImage'] = _voucherImage;
    map['VoucherValidity'] = _voucherValidity;
    map['VoucherValue'] = _voucherValue;
    map['ProductId'] = _productId;
    map['MinExpAmount'] = _minExpAmount;
    map['RewardPoint'] = _rewardPoint;
    return map;
  }

}