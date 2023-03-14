class GetPayload {

    String? msisdn;
    int? responseCode;
    String? responseDescription;
    String? responseDescriptionLocal;
    String? transactionId;

    GetPayload({this.msisdn, this.responseCode, this.responseDescription, this.responseDescriptionLocal, this.transactionId});

    factory GetPayload.fromJson(Map<String, dynamic> json) {
        return GetPayload(
            msisdn: json['Msisdn'],
            responseCode: json['ResponseCode'],
            responseDescription: json['ResponseDescription'],
            responseDescriptionLocal: json['ResponseDescriptionLocal'] ,
            transactionId: json['TransactionId'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['Msisdn'] = this.msisdn;
        data['ResponseCode'] = this.responseCode;
        data['ResponseDescription'] = this.responseDescription;

        if (this.responseDescriptionLocal != null) {
            data['ResponseDescriptionLocal'] = this.responseDescriptionLocal;
        }
        if (this.transactionId != null) {
            data['TransactionId'] = this.transactionId;
        }
        return data;
    }
}