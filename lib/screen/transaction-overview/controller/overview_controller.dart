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
import '../../../shared_prefs_helper.dart';
class TransactionOverviewController extends  GetxController with StateMixin{


  final AppRepository _appRepository=AppRepository();

  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onClose() {
    super.onClose();
  }

  doTransaction(String keyword,String destinationNumber,String amount,String pin,String reference,String customerMsisdn){
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
                      var transactionBody=TransactionBody(msisdn: customerMsisdn.isEmpty?msisdn:customerMsisdn,appVersion: appVersion,fullName: fullName,messageBody: reference.isEmpty?keyword+" "+destinationNumber+" "+amount+" "+pin: keyword+" "+destinationNumber+" "+amount+" "+reference+" "+pin,osVersion: osVersion,phoneBrand: phoneBrand,phoneOs: os);
                      print("Body::"+transactionBody.toJson().toString());
                      DialogHelper.showLoading("Please Wait");
                      TransactionResponse  response= await _appRepository.getTransaction(transactionBody,token);
                      print("Response::"+response.toJson().toString());
                      if(response.responseCode==100 && response.transactionId!.isNotEmpty && response.transactionId!.length>4){
                        DialogHelper.hideLoading();
                        Get.to( SuccessScreen(),arguments: [response.transactionId!,keyword,destinationNumber,customerMsisdn, destinationNumber, msisdn]);
                        print('customer number $customerMsisdn --- $destinationNumber');
                        print('customer number-------- $msisdn ');

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


}