class ValidateOtpResponse {

    bool isUserExist;
    String msisdn;
    String? password;
    int responseCode;
    String responseDescription;
    int walletType;

    ValidateOtpResponse({ required this.isUserExist, required this.msisdn,  this.password, required this.responseCode, required this.responseDescription, required this.walletType});

    factory ValidateOtpResponse.fromJson(Map<String, dynamic> json) {
        return ValidateOtpResponse(
            isUserExist: json['IsUserExist'],
            msisdn: json['Msisdn'],
            password: json['Password'],
            responseCode: json['ResponseCode'],
            responseDescription: json['ResponseDescription'],
            walletType: json['WalletType'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['IsUserExist'] = this.isUserExist;
        data['Msisdn'] = this.msisdn;
        data['Password'] = this.password;
        data['ResponseCode'] = this.responseCode;
        data['ResponseDescription'] = this.responseDescription;
        data['WalletType'] = this.walletType;
        return data;
    }
}