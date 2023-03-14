import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/model/body/validateotp/ValidateOtpBody.dart';
import 'package:wallet_merchant/model/response/validateotp/ValidateOtpResponse.dart';
import 'package:wallet_merchant/repository/repository.dart';
import 'package:wallet_merchant/screen/dashboard/dashboard.dart';
import 'package:wallet_merchant/shared_prefs_helper.dart';

import '../../../DialogHelper.dart';
import '../../../app_and_device_info.dart';
import '../../../model/body/getappotp/GetAppOtpBody.dart';
import '../../../model/response/getappotp/GetAppOtpResponse.dart';

class OtpController extends GetxController with StateMixin{

  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  late TextEditingController otpController;
  var otp = '';

  late CountdownTimerController controller;
  var endTime = (DateTime.now().millisecondsSinceEpoch + 1000 * 300).obs;
  var isLoading=0.obs;
  final AppRepository _appRepository=AppRepository();


  @override
  void onInit() {
    super.onInit();
    otpController = TextEditingController();
    controller = CountdownTimerController(endTime: endTime.value);

  }

  restartTime(String phone){
    endTime.value = (DateTime.now().millisecondsSinceEpoch + 1000 * 300);
    controller = CountdownTimerController(endTime: endTime.value);
    resendOtp(phone);
  }


  resendOtp(String phone){

    getAppVersion().then((appVersion) => {
      getDeviceId().then((deviceId) => {
        getFlag().then((flag) => {
          getFullName().then((fullName) => {
            getOsVersion().then((osVersion) => {
              getPhoneBrand().then((phoneBrand) => {
                getOs().then((os)  async {
                  if (kDebugMode) {
                    print("App Version:"+appVersion+","+"Device Id:"+deviceId+","+"flag:"+flag+","+"FullName:"+fullName!+","+"Os Version:"+osVersion!+","+"phone Brand:"+phoneBrand!+","+"Os:"+os!);
                  }
                  DialogHelper.showLoading("Please Wait");
                  var getAppOtpBody=GetAppOtpBody(appVersion: appVersion, deviceId: deviceId, FLAG: flag, fullName: fullName!, msisdn: phone, osVersion: osVersion!, phoneBrand: phoneBrand!, phoneOs: os!);
                  print("Body::"+getAppOtpBody.toJson().toString());
                  GetAppOtpResponse  response= await _appRepository.getAppOtp(getAppOtpBody);
                  print("Response::"+response.toJson().toString());
                  if(response.payload?.responseCode==100){
                    DialogHelper.hideLoading();
                  }else{
                    DialogHelper.hideLoading();
                  }
                })
              })
            })
          })
        })
      })
    });

  }

  @override
  void onClose() {
    otpController.dispose();
    controller.dispose();
  }

  String? validateOtp(String value) {
    if (value.length < 6) {
      return "Otp not valid";
    }
    return null;
  }

  checkLogin(){
    final isValid = otpFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    otpFormKey.currentState!.save();
    isLoading++;

    getAppVersion().then((appVersion) => {
      getDeviceId().then((deviceId) => {
        getFlag().then((flag) => {
          getFullName().then((fullName) => {
            getOsVersion().then((osVersion) => {
              getPhoneBrand().then((phoneBrand) => {
               SharedPrefsHelper.getMsisdn().then((msisdn) => {
                getOs().then((os)  async {
                  if (kDebugMode) {
                    print("App Version:"+appVersion+","+"Device Id:"+deviceId+","+"flag:"+flag+","+"FullName:"+fullName!+","+"Os Version:"+osVersion!+","+"phone Brand:"+phoneBrand!+","+"Os:"+os!);
                  }
                  var validateOtpBody=ValidateOtpBody(appVersion: appVersion, deviceId: deviceId, fLAG: flag, fullName: fullName!, msisdn: msisdn, osVersion: osVersion!, phoneBrand: phoneBrand!, phoneOs: os!,otp: otp);
                  print("Body::"+validateOtpBody.toJson().toString());
                  ValidateOtpResponse  response= await _appRepository.validateOtp(validateOtpBody);
                  print("Response::"+response.toJson().toString());
                  if(response.responseCode==100){
                    isLoading--;
                    Get.offAll(const Dashboard());
                    SharedPrefsHelper.storeBasicToken(response.password!, msisdn);
                    SharedPrefsHelper.storeWalletType(response.walletType);
                  }else{
                    isLoading--;
                    Fluttertoast.showToast(
                        backgroundColor: Colors.red,
                        msg: response.responseDescription,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM);
                  }
                })
              })
              })
            })
          })
        })
      })
    });



  }

}