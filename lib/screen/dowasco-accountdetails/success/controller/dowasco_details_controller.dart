import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/model/body/success/SuccessBody.dart';
import 'package:wallet_merchant/model/response/success/SuccessResponse.dart';
import 'package:wallet_merchant/repository/repository.dart';

import '../../../../DialogHelper.dart';
import '../../../../model/response/dowasco/reponse/GetAccountDetailsResponse.dart';
import '../../../../shared_prefs_helper.dart';

class DowascoDetailsController extends  GetxController with StateMixin{

  final AppRepository _appRepository=AppRepository();

  var getAccountDetailsResponse=GetAccountDetailsResponse(issuccess: false).obs;



  @override
  void onInit() {
    super.onInit();

    var accountNumber=Get.arguments[0];


    SharedPrefsHelper.getServiceToken().then((token)async {

      DialogHelper.showLoading("Please Wait");
      GetAccountDetailsResponse  response= await _appRepository.getDowascoAccountDetails(token,int.parse(accountNumber));
      print("Response::"+response.toJson().toString());
      if(response.issuccess==true){
        DialogHelper.hideLoading();
        getAccountDetailsResponse.value=response;

      }else{
        DialogHelper.hideLoading();
        Fluttertoast.showToast(
            backgroundColor: Colors.red,
            msg: "Account Number Not Valid",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
      }

    });







  }
  @override
  void onClose() {
    super.onClose();
  }


}