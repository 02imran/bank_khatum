import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../DialogHelper.dart';
import '../../../app_and_device_info.dart';
import '../../../model/response/merchant-list-response/MerchantListResponse.dart';
import '../../../model/response/merchant-list-token-response/MerchantListTokenResponse.dart';
import '../../../repository/repository.dart';
import '../../../shared_prefs_helper.dart';
class DynamicMerchantListController extends  GetxController with StateMixin{

  final AppRepository _appRepository=AppRepository();

  var myMerchantListResponseData=MerchantListResponse().obs;


  @override
  void onInit() {
    super.onInit();
    String menuCode=Get.arguments[0];

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

                      MerchantListTokenResponse  response= await _appRepository.getMerchantListToken();
                      print('Token :::::::::::--------------- $token');

                      if (kDebugMode) {
                        print("Response::::::"+response.toJson().toString());
                      }
                      if(response.issuccess!){
                        MerchantListResponse  merchantListResponse= await _appRepository.getMerchantList(menuCode,response.payload!.token!);


                        print("Response::"+merchantListResponse.toJson().toString());

                        if(merchantListResponse.issuccess!){
                          DialogHelper.hideLoading();
                          myMerchantListResponseData.value=merchantListResponse;
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

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

}