/// latitude : "23.753932799733295"
/// longitude : "90.35981364548205"
/// msisdn : "85534292667"


class LocationBody {
  LocationBody({
      String? latitude, 
      String? longitude, 
      String? msisdn,}){
    _latitude = latitude;
    _longitude = longitude;
    _msisdn = msisdn;
}

  LocationBody.fromJson(dynamic json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _msisdn = json['msisdn'];
  }
  String? _latitude;
  String? _longitude;
  String? _msisdn;

  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get msisdn => _msisdn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['msisdn'] = _msisdn;
    return map;
  }

}