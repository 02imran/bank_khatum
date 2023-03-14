import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/model/body/app-login/AppLoginBody.dart';
import 'package:wallet_merchant/model/body/my-message/MyMessageBody.dart';
import 'package:wallet_merchant/model/response/message-token/MessageTokenResponse.dart';
import 'package:wallet_merchant/model/response/my-message/MyMessageResponse.dart';
import 'package:wallet_merchant/repository/repository.dart';

import '../../../DialogHelper.dart';
import '../../../app_and_device_info.dart';
import '../../../shared_prefs_helper.dart';
class MyMessageController extends GetxController with StateMixin{



  final AppRepository _appRepository=AppRepository();

  var myMessageResponseData=MyMessageResponse().obs;


  @override
  void onInit() {
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

                      DialogHelper.showLoading("Please Wait");
                      MessageTokenResponse  response= await _appRepository.getMessageToken();
                      print("Response::"+response.toJson().toString());
                      if(response.issuccess!){
                        var messageBody=MyMessageBody(msisdn: msisdn);
                        print("Body::"+messageBody.toJson().toString());
                        MyMessageResponse  myMessageResponse= await _appRepository.getMyMessage(messageBody,response.payload!.token!);
                        print("Response::"+myMessageResponse.toJson().toString());

                        if(myMessageResponse.responseCode==100){
                          DialogHelper.hideLoading();
                          myMessageResponseData.value=myMessageResponse;
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