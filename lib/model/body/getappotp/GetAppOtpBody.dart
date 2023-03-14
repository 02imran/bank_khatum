class GetAppOtpBody {
    String appVersion;
    String deviceId;
    String FLAG;
    String fullName;
    String msisdn;
    String osVersion;
    String phoneBrand;
    String phoneOs;

    GetAppOtpBody({required this.appVersion, required this.deviceId, required this.FLAG, required this.fullName, required this.msisdn, required this.osVersion, required this.phoneBrand, required this.phoneOs});

    factory GetAppOtpBody.fromJson(Map<String, dynamic> json) {
        return GetAppOtpBody(
            appVersion: json['AppVersion'],
            deviceId: json['DeviceId'],
            FLAG: json['FLAG'],
            fullName: json['FullName'],
            msisdn: json['Msisdn'],
            osVersion: json['OsVersion'],
            phoneBrand: json['PhoneBrand'],
            phoneOs: json['PhoneOs'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['AppVersion'] = this.appVersion;
        data['DeviceId'] = this.deviceId;
        data['FLAG'] = this.FLAG;
        data['FullName'] = this.fullName;
        data['Msisdn'] = this.msisdn;
        data['OsVersion'] = this.osVersion;
        data['PhoneBrand'] = this.phoneBrand;
        data['PhoneOs'] = this.phoneOs;
        return data;
    }
}