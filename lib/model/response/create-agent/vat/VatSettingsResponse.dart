/// VatSettingLicensed : [{"Id":"0","Description":"No VAT applicable"},{"Id":"1","Description":"VAT registered - VAT is extra"},{"Id":"2","Description":"VAT registered - VAT is included"}]
/// VatSettingNonLicensed : [{"Id":"0","Description":"No VAT applicable"},{"Id":"3","Description":"VAT not registered – WHT is withhold"},{"Id":"4","Description":"VAT not registered – WHT is not withhold"}]



class VatSettingsResponse {
  VatSettingsResponse({
      List<VatSettingLicensed>? vatSettingLicensed, 
      List<VatSettingNonLicensed>? vatSettingNonLicensed,}){
    _vatSettingLicensed = vatSettingLicensed;
    _vatSettingNonLicensed = vatSettingNonLicensed;
}

  VatSettingsResponse.fromJson(dynamic json) {
    if (json['VatSettingLicensed'] != null) {
      _vatSettingLicensed = [];
      json['VatSettingLicensed'].forEach((v) {
        _vatSettingLicensed?.add(VatSettingLicensed.fromJson(v));
      });
    }
    if (json['VatSettingNonLicensed'] != null) {
      _vatSettingNonLicensed = [];
      json['VatSettingNonLicensed'].forEach((v) {
        _vatSettingNonLicensed?.add(VatSettingNonLicensed.fromJson(v));
      });
    }
  }
  List<VatSettingLicensed>? _vatSettingLicensed;
  List<VatSettingNonLicensed>? _vatSettingNonLicensed;

  List<VatSettingLicensed>? get vatSettingLicensed => _vatSettingLicensed;
  List<VatSettingNonLicensed>? get vatSettingNonLicensed => _vatSettingNonLicensed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_vatSettingLicensed != null) {
      map['VatSettingLicensed'] = _vatSettingLicensed?.map((v) => v.toJson()).toList();
    }
    if (_vatSettingNonLicensed != null) {
      map['VatSettingNonLicensed'] = _vatSettingNonLicensed?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Id : "0"
/// Description : "No VAT applicable"

class VatSettingNonLicensed {
  VatSettingNonLicensed({
      String? id, 
      String? description,}){
    _id = id;
    _description = description;
}

  VatSettingNonLicensed.fromJson(dynamic json) {
    _id = json['Id'];
    _description = json['Description'];
  }
  String? _id;
  String? _description;

  String? get id => _id;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['Description'] = _description;
    return map;
  }

}

/// Id : "0"
/// Description : "No VAT applicable"

class VatSettingLicensed {
  VatSettingLicensed({
      String? id, 
      String? description,}){
    _id = id;
    _description = description;
}

  VatSettingLicensed.fromJson(dynamic json) {
    _id = json['Id'];
    _description = json['Description'];
  }
  String? _id;
  String? _description;

  String? get id => _id;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['Description'] = _description;
    return map;
  }

}