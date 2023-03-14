import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wallet_merchant/model/body/app-login/AppLoginBody.dart';
import 'package:wallet_merchant/model/response/balance/BalanceResponse.dart';
import 'package:wallet_merchant/repository/repository.dart';

import '../../../DialogHelper.dart';
import '../../../app_and_device_info.dart';
import '../../../shared_prefs_helper.dart';
import 'package:wallet_merchant/model/response/app-login/AppLoginResponse.dart';

class BalanceController  extends GetxController with StateMixin{



  var balance="".obs;
  final AppRepository _appRepository=AppRepository();
  final format = NumberFormat("#,###");

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

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

                        BalanceResponse balanceResponse= await _appRepository.getBalance( response.payload!.token!);

                        if(balanceResponse.issuccess!){
                          DialogHelper.hideLoading();
                          balance.value = '${calc_ranks(balanceResponse.payload!.amount!)}';

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

  int calc_ranks(ranks) {
    return ranks.round();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}