import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/pakage_purchase/components/success_screen.dart';

import '../../../DialogHelper.dart';
import '../../../app_and_device_info.dart';
import '../../../main.dart';
import '../../../repository/repository.dart';
import '../../../shared_prefs_helper.dart';
import '../models/body/pakage_purchage_body.dart';
import '../models/body/payment_process_body.dart';
import '../models/response/membership_id_response_model.dart';
import '../models/response/pakage_purchage_response_model.dart';
import '../models/response/payment_process_response_model.dart';

class PakagePurchageController extends GetxController {
  GlobalKey<FormState> signInFromKey = GlobalKey<FormState>();

  late TextEditingController subIdControllerSignIn;
  var subId = '';
  TextEditingController rechargeAmountController = TextEditingController();

  final AppRepository _appRepository = AppRepository();
  RxList<Package> pakageList = <Package>[].obs;
  var pmsmembershipid = ''.obs;

  var amount = ''.obs;

  @override
  void onInit() {
    subIdControllerSignIn = TextEditingController();
    // getAkashPakageList();
    super.onInit();
  }

  getMembershipId() async {
    // final isValid = signInFromKey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    // signInFromKey.currentState!.save();

    MembershipIdBody body = MembershipIdBody(
      subid: subIdControllerSignIn.text,
    );
    print(subIdControllerSignIn.text);
    DialogHelper.showLoading("Please Wait");
    MembershipIdResponseModel response = await _appRepository.getMemberId(body);
    print("Response::" + response.toJson().toString());
    if (response.issuccess!) {
      DialogHelper.hideLoading();
      pmsmembershipid.value = response.payload?.pmsmembershipid ?? '';
    } else {
      DialogHelper.hideLoading();
    }
  }

  getAkashPakageList() async {
    PakageList response = await _appRepository.getAkashPakageList();
    if (kDebugMode) {
      printInfo(info: "Response::" + response.toJson().toString());
    }
    DialogHelper.showLoading();
    if (response.issuccess == true) {
      DialogHelper.hideLoading();
      pakageList.value = response.payload!.packages ?? [];
    } else {
      DialogHelper.hideLoading();
    }
  }

  paymentProcess(var id, var amount) async{
    SharedPrefsHelper.getMsisdn().then((msisdn) => {
          getOs().then((os) async {
            PaymentProcessBody body = PaymentProcessBody(
                amount: amount,
                currency: "XCD",
                sourceWalletId: msisdn,
                destWalletId: pmsmembershipid.value,
                keyword: "PMNT",
                transactionFee: '0',
                transactionComm: '0',
                chargePayer: 1,
                comissionReceiver: 0,
                // referenceId: '$id'
                referenceId: '${subIdControllerSignIn.text}|$id'
            );
            print('Body ::::::::: ${body.toJson().toString()}');
            DialogHelper.showLoading("Please Wait");
            PaymentProcessResponseModel response =
                await _appRepository.paymentProcess(body);
            print("Response::" + response.toString());
            if (response.responseCode == 106) {
              DialogHelper.hideLoading();
              Get.to(()=>const SuccessScreen());
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
  }

  String? validateSubId(String value) {
    if (value.length < 8) {
      return "Sub Id must be 8 digit";
    }
    return null;
  }

  @override
  void onClose() {
    subIdControllerSignIn.dispose();
    rechargeAmountController.dispose();
    super.onClose();
  }
}
