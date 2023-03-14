import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/app_and_device_info.dart';
import 'package:wallet_merchant/constants.dart';
import 'package:wallet_merchant/model/body/getappotp/GetAppOtpBody.dart';
import 'package:wallet_merchant/model/response/getappotp/GetAppOtpResponse.dart';
import 'package:wallet_merchant/repository/repository.dart';
import 'package:wallet_merchant/screen/otp/otp_screen.dart';
import 'package:wallet_merchant/shared_prefs_helper.dart';

import '../../../model/body/app_register/AppRegisterBody.dart';
import '../../../model/response/app_register/AppRegisterResponse.dart';

class LoginController extends GetxController with StateMixin{

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController phoneController;
  var phone = '';
  var isLoading=0.obs;
  final AppRepository _appRepository=AppRepository();

  @override
  void onInit() {
    super.onInit();

    phoneController = TextEditingController();

  }

  @override
  void onClose() {
    phoneController.dispose();
  }

  String? validatePhone(String value) {
    if (value.length < 8) {
      return "Phone number not valid";
    }
    return null;
  }

  // checkLogin(){
  //   final isValid = loginFormKey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   loginFormKey.currentState!.save();
  //   isLoading++;
  //   getAppVersion().then((appVersion) => {
  //     getDeviceId().then((deviceId) => {
  //       getFlag().then((flag) => {
  //         getFullName().then((fullName) => {
  //           getOsVersion().then((osVersion) => {
  //             getPhoneBrand().then((phoneBrand) => {
  //               getOs().then((os)  async {
  //                 if (kDebugMode) {
  //                   print("App Version:"+appVersion+","+"Device Id:"+deviceId+","+"flag:"+flag+","+"FullName:"+fullName!+","+"Os Version:"+osVersion!+","+"phone Brand:"+phoneBrand!+","+"Os:"+os!);
  //                 }
  //                 var getAppOtpBody=GetAppOtpBody(appVersion: appVersion, deviceId: deviceId, FLAG: flag, fullName: fullName!, msisdn: mobilePrefix+phone, osVersion: osVersion!, phoneBrand: phoneBrand!, phoneOs: os!);
  //                 print("Body::"+getAppOtpBody.toJson().toString());
  //                 GetAppOtpResponse  response= await _appRepository.getAppOtp(getAppOtpBody);
  //                 print("Response::"+response.toJson().toString());
  //                 if(response.payload?.responseCode==100){
  //                   isLoading--;
  //                   SharedPrefsHelper.storeMsisdn(response.payload!.msisdn!);
  //                   Get.to(const OtpScreen(),arguments: [mobilePrefix+phone]);
  //                 }else{
  //                   isLoading--;
  //                   Fluttertoast.showToast(
  //                       backgroundColor: Colors.red,
  //                       msg: response.payload!.responseDescription!,
  //                       toastLength: Toast.LENGTH_SHORT,
  //                       gravity: ToastGravity.BOTTOM);
  //                 }
  //
  //               })
  //             })
  //           })
  //         })
  //       })
  //     })
  //   });
  //
  // }

  checkLogin(){
    // final isValid = loginFormKey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    // loginFormKey.currentState!.save();
    isLoading++;
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
                  var getAppOtpBody=AppRegisterBody(appVersion: appVersion, deviceId: deviceId, flag: flag, fullName: fullName!, msisdn: mobilePrefix+phone, osVersion: osVersion!, phoneBrand: phoneBrand!, phoneOs: os!);
                  print("Body::"+getAppOtpBody.toJson().toString());
                  AppRegisterResponse  response= await _appRepository.getAppReg(getAppOtpBody);
                  print("Response::"+response.toJson().toString());
                  if(response.responseCode==100){
                    isLoading--;
                    // SharedPrefsHelper.storeMsisdn(response.msisdn!);
                    Get.to(const OtpScreen(),arguments: [mobilePrefix+phone]);
                  }else{
                    isLoading--;
                    Fluttertoast.showToast(
                        backgroundColor: Colors.red,
                        msg: response.responseDescription!,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM);
                  }

                })
              })
            })
          })
        })
      })
    });

  }

  validateLogin(){
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    isLoading++;
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
                  var getAppOtpBody=AppRegisterBody(appVersion: appVersion, deviceId: deviceId, flag: flag, fullName: fullName!, msisdn: mobilePrefix+phone, osVersion: osVersion!, phoneBrand: phoneBrand!, phoneOs: os!);
                  print("Body::"+getAppOtpBody.toJson().toString());
                  AppRegisterResponse  response= await _appRepository.getValidate(getAppOtpBody);
                  print("Response::"+response.toJson().toString());
                  if(response.responseCode==100){
                    isLoading--;
                    SharedPrefsHelper.storeMsisdn(response.msisdn!);
                    checkLogin();
                  }else{
                    isLoading--;
                    Fluttertoast.showToast(
                        backgroundColor: Colors.red,
                        msg: response.responseDescription!,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM);
                  }

                })
              })
            })
          })
        })
      })
    });

  }


}