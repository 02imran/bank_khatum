/// Msisdn : "85537866093"
/// Pin : "1478"
/// SecurityQuestionList : [{"Answer":"me","QuestionId":1},{"Answer":"me","QuestionId":2},{"Answer":"me","QuestionId":3},{"Answer":"me","QuestionId":4},{"Answer":"me","QuestionId":5}]

class SetSecurityQuestionBody {
  SetSecurityQuestionBody({
      String? msisdn, 
      String? pin, 
      List<SecurityQuestionList>? securityQuestionList,}){
    _msisdn = msisdn;
    _pin = pin;
    _securityQuestionList = securityQuestionList;
}

  SetSecurityQuestionBody.fromJson(dynamic json) {
    _msisdn = json['Msisdn'];
    _pin = json['Pin'];
    if (json['SecurityQuestionList'] != null) {
      _securityQuestionList = [];
      json['SecurityQuestionList'].forEach((v) {
        _securityQuestionList?.add(SecurityQuestionList.fromJson(v));
      });
    }
  }
  String? _msisdn;
  String? _pin;
  List<SecurityQuestionList>? _securityQuestionList;

  String? get msisdn => _msisdn;
  String? get pin => _pin;
  List<SecurityQuestionList>? get securityQuestionList => _securityQuestionList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Msisdn'] = _msisdn;
    map['Pin'] = _pin;
    if (_securityQuestionList != null) {
      map['SecurityQuestionList'] = _securityQuestionList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Answer : "me"
/// QuestionId : 1

class SecurityQuestionList {
  SecurityQuestionList({
      String? answer, 
      int? questionId,}){
    _answer = answer;
    _questionId = questionId;
}

  SecurityQuestionList.fromJson(dynamic json) {
    _answer = json['Answer'];
    _questionId = json['QuestionId'];
  }
  String? _answer;
  int? _questionId;

  String? get answer => _answer;
  int? get questionId => _questionId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Answer'] = _answer;
    map['QuestionId'] = _questionId;
    return map;
  }

  @override
  String toString() {
    return 'SecurityQuestionList{_answer: $_answer, _questionId: $_questionId}';
  }
}