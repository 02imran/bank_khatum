/// FromDate : "2022-02-20"
/// Msisdn : "85511234567"
/// Page : "1"
/// PageSize : "10"
/// Pin : ""
/// ToDate : "2022-03-02"


class ReportBody {
  ReportBody({
      String? fromDate, 
      String? msisdn, 
      String? page, 
      String? pageSize, 
      String? pin, 
      String? toDate,}){
    _fromDate = fromDate;
    _msisdn = msisdn;
    _page = page;
    _pageSize = pageSize;
    _pin = pin;
    _toDate = toDate;
}

  ReportBody.fromJson(dynamic json) {
    _fromDate = json['FromDate'];
    _msisdn = json['Msisdn'];
    _page = json['Page'];
    _pageSize = json['PageSize'];
    _pin = json['Pin'];
    _toDate = json['ToDate'];
  }
  String? _fromDate;
  String? _msisdn;
  String? _page;
  String? _pageSize;
  String? _pin;
  String? _toDate;

  String? get fromDate => _fromDate;
  String? get msisdn => _msisdn;
  String? get page => _page;
  String? get pageSize => _pageSize;
  String? get pin => _pin;
  String? get toDate => _toDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FromDate'] = _fromDate;
    map['Msisdn'] = _msisdn;
    map['Page'] = _page;
    map['PageSize'] = _pageSize;
    map['Pin'] = _pin;
    map['ToDate'] = _toDate;
    return map;
  }

}