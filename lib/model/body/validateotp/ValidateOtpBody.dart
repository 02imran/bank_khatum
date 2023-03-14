class ValidateOtpBody {
    String appVersion;
    String deviceId;
    String fLAG;
    String fullName;
    String msisdn;
    String osVersion;
    String otp;
    String phoneBrand;
    String phoneOs;

    ValidateOtpBody({required this.appVersion, required this.deviceId, required this.fLAG, required this.fullName, required this.msisdn, required this.osVersion, required this.otp, required this.phoneBrand, required this.phoneOs});

    factory ValidateOtpBody.fromJson(Map<String, dynamic> json) {
        return ValidateOtpBody(
            appVersion: json['AppVersion'],
            deviceId: json['DeviceId'],
            fLAG: json['FLAG'],
            fullName: json['FullName'],
            msisdn: json['Msisdn'],
            osVersion: json['OsVersion'],
            otp: json['otp'], 
            phoneBrand: json['PhoneBrand'],
            phoneOs: json['PhoneOs'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['AppVersion'] = this.appVersion;
        data['DeviceId'] = this.deviceId;
        data['FLAG'] = this.fLAG;
        data['FullName'] = this.fullName;
        data['Msisdn'] = this.msisdn;
        data['OsVersion'] = this.osVersion;
        data['otp'] = this.otp;
        data['PhoneBrand'] = this.phoneBrand;
        data['PhoneOs'] = this.phoneOs;
        return data;
    }
}