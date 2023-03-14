import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/model/body/transaction/TransactionBody.dart';
import 'package:wallet_merchant/model/response/transaction/TransactionResponse.dart';
import 'package:wallet_merchant/repository/repository.dart';
import 'package:wallet_merchant/screen/success/success_screen.dart';

import '../../../DialogHelper.dart';
import '../../../app_and_device_info.dart';
import '../../../model/body/app-login/AppLoginBody.dart';
import '../../../model/response/app-login/AppLoginResponse.dart';
import '../../../model/response/transaction-refund-response/TransactionRefundResponse.dart';
import '../../../shared_prefs_helper.dart';
import '../../refund-success/refund_success_screen.dart';
class RefundOverviewController extends  GetxController with StateMixin{


  final AppRepository _appRepository=AppRepository();

  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onClose() {
    super.onClose();
  }



  refundTransaction(String transactionId,String amount,String toAccount){

    getAppVersion().then((appVersion) => {
      getDeviceId().then((deviceId) => {
        getFlag().then((flag) => {
          getFullName().then((fullName) => {
            getOsVersion().then((osVersion) => {
              getPhoneBrand().then((phoneBrand) => {
                SharedPrefsHelper.getMsisdn().then((msisdn) => {
                  SharedPrefsHelper.getBasicToken().then((token) => {
                    getOs().then((os)  async {
                      if (kDebugMode) {
                        print("App Version:"+appVersion+","+"Device Id:"+deviceId+","+"flag:"+flag+","+"FullName:"+fullName!+","+"Os Version:"+osVersion!+","+"phone Brand:"+phoneBrand!+","+"Os:"+os!);
                      }
                      var appLoginBody=AppLoginBody(phoneOs: os,phoneBrand: phoneBrand,msisdn: msisdn,deviceId: deviceId );
                      print("Body::"+appLoginBody.toJson().toString());
                      DialogHelper.showLoading("Please Wait");
                      AppLoginResponse  response= await _appRepository.getAppLogin(appLoginBody);
                      print("Response::"+response.toJson().toString());
                      if(response.issuccess!){

                        TransactionRefundResponse  refundResponse= await _appRepository.refundTransaction(response.payload!.token!,transactionId);
                        print("Response::"+refundResponse.toJson().toString());

                        if(refundResponse.issuccess!){
                          DialogHelper.hideLoading();
                          Get.to(const RefundSuccessScreen(),arguments: [refundResponse,amount,toAccount]);
                        }else{
                          DialogHelper.hideLoading();
                        }


                      }else{
                        DialogHelper.hideLoading();

                      }
                    })
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