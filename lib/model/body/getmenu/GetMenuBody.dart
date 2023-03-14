class GetMenuBody {
    String appVersion;
    String deviceId;
    String fullName;
    String msisdn;
    String osVersion;
    String phoneBrand;
    String phoneOs;

    GetMenuBody({required this.appVersion, required this.deviceId, required this.fullName, required this.msisdn, required this.osVersion, required this.phoneBrand, required this.phoneOs});

    factory GetMenuBody.fromJson(Map<String, dynamic> json) {
        return GetMenuBody(
            appVersion: json['appVersion'], 
            deviceId: json['deviceId'], 
            fullName: json['fullName'], 
            msisdn: json['msisdn'], 
            osVersion: json['osVersion'], 
            phoneBrand: json['phoneBrand'], 
            phoneOs: json['phoneOs'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['appVersion'] = this.appVersion;
        data['deviceId'] = this.deviceId;
        data['fullName'] = this.fullName;
        data['msisdn'] = this.msisdn;
        data['osVersion'] = this.osVersion;
        data['phoneBrand'] = this.phoneBrand;
        data['phoneOs'] = this.phoneOs;
        return data;
    }
}