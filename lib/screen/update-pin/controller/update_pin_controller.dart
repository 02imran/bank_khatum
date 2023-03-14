import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/model/body/reset-pin/ResetPinBody.dart';
import 'package:wallet_merchant/model/body/update-pin/UpdatePinBody.dart';
import 'package:wallet_merchant/model/response/reset-pin/ResetPinReponse.dart';
import 'package:wallet_merchant/model/response/update-pin/UpdatePinReponse.dart';
import 'package:wallet_merchant/repository/repository.dart';
import 'package:wallet_merchant/screen/common-success-update-pin/common_success_update_pin.dart';
import 'package:wallet_merchant/screen/common-success/common_success.dart';

import '../../../DialogHelper.dart';
import '../../../shared_prefs_helper.dart';
class UpdatePinController extends  GetxController with StateMixin{

  final GlobalKey<FormState> setPinFromKey = GlobalKey<FormState>();

  late TextEditingController newPinController;
  var newPin = '';

  late TextEditingController reEnterPinController;
  var reEnterPin = '';

  late TextEditingController curentPinController;
  var curentPin = '';

  final AppRepository _appRepository=AppRepository();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    newPinController = TextEditingController();
    reEnterPinController = TextEditingController();
    curentPinController = TextEditingController();

  }


  validateNewPin(String value) {
    if (value.length != 4) {
      return "Pin  not valid";
    }
    return null;
  }

  updatePin(bool isOpenFromMenu){
    final isValid = setPinFromKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    setPinFromKey.currentState!.save();

    if(newPin==reEnterPin) {
      SharedPrefsHelper.getMsisdn().then((msisdn) =>
      {
        SharedPrefsHelper.getBasicToken().then((token) async {
          DialogHelper.showLoading("Please Wait");

          var body = UpdatePinBody(msisdn: msisdn, newPin: newPin,oldPin: curentPin);
          UpdatePinReponse response = await _appRepository.updatePin(body, token);
          if (response.responseCode! == 100) {
            DialogHelper.hideLoading();
            if(isOpenFromMenu){
              Get.to(const CommonSuccess(), arguments: ["Change PIN Successfully"]);
            }else{
              Get.to(const CommonSuccessUpdatePin(), arguments: ["Change PIN Successfully"]);
            }

          } else {

            DialogHelper.hideLoading();
            Fluttertoast.showToast(
                backgroundColor: Colors.red,
                msg: response.responseDescription!,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM);
          }
        })
      });
    }else{

      Fluttertoast.showToast(
          backgroundColor: Colors.red,
          msg: "Pin Not Matched",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
    }



  }


  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    newPinController.dispose();
    reEnterPinController.dispose();
    curentPinController.dispose();
  }



}