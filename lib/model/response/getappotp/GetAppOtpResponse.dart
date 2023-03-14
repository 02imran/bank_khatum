import 'Payload.dart';

class GetAppOtpResponse {
    int code;
    String message;
    GetPayload? payload;
    String status;

    GetAppOtpResponse({required this.code, required this.message, this.payload, required this.status});

    factory GetAppOtpResponse.fromJson(Map<String, dynamic> json) {
        return GetAppOtpResponse(
            code: json['code'], 
            message: json['message'], 
            payload: json['payload'] != null ? GetPayload.fromJson(json['payload']) : null,
            status: json['status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['code'] = this.code;
        data['message'] = this.message;
        data['status'] = this.status;
        if (this.payload != null) {
            data['payload'] = this.payload?.toJson();
        }
        return data;
    }
}