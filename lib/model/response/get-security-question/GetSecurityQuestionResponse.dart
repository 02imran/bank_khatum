/// SecurityQuestionList : [{"QuestionId":1,"Question":"What is your favorite Animal name?","Answer":null,"QuestionLocal":"តើសត្វដែលលោកអ្នកចូលចិត្តមានឈ្មោះអ្វីដែរ?"},{"QuestionId":2,"Question":"What is your favorite color?","Answer":null,"QuestionLocal":"តើលោកអ្នកចូលចិត្តពណ៌អ្វីដែរ?"},{"QuestionId":3,"Question":"What is your first motorbike brand?","Answer":null,"QuestionLocal":"តើម៉ូតូដំបូងរបស់លោកអ្នកជាម៉ាកអ្វីដែរ?"},{"QuestionId":4,"Question":"Where is your birth place?","Answer":null,"QuestionLocal":"តើកន្លែងកំណើតរបស់លោកអ្នកនៅឯណា?"},{"QuestionId":5,"Question":"Where is your mother's birthplace?","Answer":null,"QuestionLocal":"តើកន្លែងកំណើតម្តាយរបស់លោកអ្នកនៅឯណា?"}]
/// Msisdn : "85537866093"
/// ResponseCode : 100
/// ResponseDescription : "Success"
/// ResponseDescriptionLocal : null
/// TransactionId : null
/// data : null


class GetSecurityQuestionResponse {
  GetSecurityQuestionResponse({
      List<SecurityQuestionList>? securityQuestionList, 
      String? msisdn, 
      int? responseCode, 
      String? responseDescription, 
      dynamic responseDescriptionLocal, 
      dynamic transactionId, 
      dynamic data,}){
    _securityQuestionList = securityQuestionList;
    _msisdn = msisdn;
    _responseCode = responseCode;
    _responseDescription = responseDescription;
    _responseDescriptionLocal = responseDescriptionLocal;
    _transactionId = transactionId;
    _data = data;
}

  GetSecurityQuestionResponse.fromJson(dynamic json) {
    if (json['SecurityQuestionList'] != null) {
      _securityQuestionList = [];
      json['SecurityQuestionList'].forEach((v) {
        _securityQuestionList?.add(SecurityQuestionList.fromJson(v));
      });
    }
    _msisdn = json['Msisdn'];
    _responseCode = json['ResponseCode'];
    _responseDescription = json['ResponseDescription'];
    _responseDescriptionLocal = json['ResponseDescriptionLocal'];
    _transactionId = json['TransactionId'];
    _data = json['data'];
  }
  List<SecurityQuestionList>? _securityQuestionList;
  String? _msisdn;
  int? _responseCode;
  String? _responseDescription;
  dynamic _responseDescriptionLocal;
  dynamic _transactionId;
  dynamic _data;

  List<SecurityQuestionList>? get securityQuestionList => _securityQuestionList;
  String? get msisdn => _msisdn;
  int? get responseCode => _responseCode;
  String? get responseDescription => _responseDescription;
  dynamic get responseDescriptionLocal => _responseDescriptionLocal;
  dynamic get transactionId => _transactionId;
  dynamic get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_securityQuestionList != null) {
      map['SecurityQuestionList'] = _securityQuestionList?.map((v) => v.toJson()).toList();
    }
    map['Msisdn'] = _msisdn;
    map['ResponseCode'] = _responseCode;
    map['ResponseDescription'] = _responseDescription;
    map['ResponseDescriptionLocal'] = _responseDescriptionLocal;
    map['TransactionId'] = _transactionId;
    map['data'] = _data;
    return map;
  }

}

/// QuestionId : 1
/// Question : "What is your favorite Animal name?"
/// Answer : null
/// QuestionLocal : "តើសត្វដែលលោកអ្នកចូលចិត្តមានឈ្មោះអ្វីដែរ?"

class SecurityQuestionList {
  SecurityQuestionList({
      int? questionId, 
      String? question, 
      dynamic answer, 
      String? questionLocal,}){
    _questionId = questionId;
    _question = question;
    _answer = answer;
    _questionLocal = questionLocal;
}

  SecurityQuestionList.fromJson(dynamic json) {
    _questionId = json['QuestionId'];
    _question = json['Question'];
    _answer = json['Answer'];
    _questionLocal = json['QuestionLocal'];
  }
  int? _questionId;
  String? _question;
  dynamic _answer;
  String? _questionLocal;

  int? get questionId => _questionId;
  String? get question => _question;
  dynamic get answer => _answer;
  String? get questionLocal => _questionLocal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['QuestionId'] = _questionId;
    map['Question'] = _question;
    map['Answer'] = _answer;
    map['QuestionLocal'] = _questionLocal;
    return map;
  }

}