import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/model/body/success/SuccessBody.dart';
import 'package:wallet_merchant/model/response/success/SuccessResponse.dart';
import 'package:wallet_merchant/repository/repository.dart';

import '../../../DialogHelper.dart';
import '../../../app_and_device_info.dart';
import '../../../shared_prefs_helper.dart';
class SuccessController extends  GetxController with StateMixin{

  final AppRepository _appRepository=AppRepository();
  var statusCode= 10.obs;
  var statusMessage="".obs;
  var fromAccount="".obs;
  var toAccount="".obs;
  var amount="".obs;
  var commissionEarned="".obs;
  var feeCharge="".obs;
  var totalAmount="".obs;
  var transactionDate="".obs;
  var transactionIdv="".obs;
  var msidn = ''.obs;



  @override
  void onInit() {
    super.onInit();

    var transactionId=Get.arguments[0];
    var keyWord=Get.arguments[1];
    var destinationAccount=Get.arguments[2];
    var customerAccount = Get.arguments[3];

    print('destination -------$destinationAccount');
    print('customer -------$customerAccount');

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
                      var successBody=SuccessBody(msisdn: msisdn,appVersion: appVersion,fullName: fullName,osVersion: osVersion,phoneBrand: phoneBrand,phoneOs: os,transactionId: transactionId);
                      print("Body::"+successBody.toJson().toString());
                      DialogHelper.showLoading("Please Wait");
                      SuccessResponse  response= await _appRepository.getTransactionResult(successBody,token);
                      print("Response::"+response.toJson().toString());
                      if(response.responseCode==100){
                        DialogHelper.hideLoading();
                        statusCode.value=response.statusCode!;
                        statusMessage.value=response.statusMsg!;
                        fromAccount.value=customerAccount;
                        msidn.value = msisdn;
                        toAccount.value=destinationAccount;
                        keyWord == 'MGIV'? amount.value=response.transactionAmount!: amount.value=(int.parse(response.transactionAmount!) +int.parse(response.chargeAmount!)).toString();
                        commissionEarned.value='${response.commissionAmount ?? 0}';
                        feeCharge.value=response.chargeAmount!.toString();
                        keyWord == 'MGIV'?  totalAmount.value=(int.parse(response.transactionAmount!)+int.parse(response.chargeAmount!)).toString():
                        totalAmount.value=(int.parse(response.transactionAmount!)+int.parse(response.chargeAmount!)).toString();
                        print('transaction amount - ${response.transactionAmount!}  charge amount - ${response.chargeAmount!}');
                        transactionDate.value=response.transactionDate!;
                        transactionIdv.value=transactionId;


                        print('-----------------------$customerAccount --------$destinationAccount');

                        // print('charge amount --------${feeCharge.value} ------${response.chargeAmount!}');

                      }else{
                        DialogHelper.hideLoading();
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
        })
      })
    });





  }
  @override
  void onClose() {
    super.onClose();
  }


}