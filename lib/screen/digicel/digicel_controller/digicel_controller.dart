import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/constants.dart';
import 'package:wallet_merchant/model/body/aml/AmlBody.dart';
import 'package:wallet_merchant/model/response/aml/AmlResponse.dart';
import 'package:wallet_merchant/repository/repository.dart';
import 'package:wallet_merchant/screen/otp/otp_screen.dart';
import 'package:wallet_merchant/screen/transaction-overview/transaction_overview_screen.dart';
import 'package:wallet_merchant/size_config.dart';

import '../../../DialogHelper.dart';
import '../../../app_and_device_info.dart';
import '../../../global.dart';
import '../../../shared_prefs_helper.dart';
import '../../merchant-payment/merchant_payment.dart';

class DigicelController extends GetxController with StateMixin {
  final GlobalKey<FormState> digicelFromKey = GlobalKey<FormState>();

  late TextEditingController phoneController;
  var phone = '';

  late TextEditingController amountController;
  var amount = '';

  late TextEditingController pinController;
  final AppRepository _appRepository=AppRepository();

  @override
  void onInit() {
    super.onInit();

    phoneController = TextEditingController();
    amountController = TextEditingController();
    pinController = TextEditingController();
  }

  @override
  void onClose() {
    phoneController.dispose();
    amountController.dispose();
    pinController.dispose();
  }

  String? validatePhone(String value) {
    if (value.length < 8) {
      return "Phone number  not valid";
    }
    return null;
  }

  String? validateAmount(String value) {
    if (value.isEmpty) {
      return "Amount not valid";
    }
    return null;
  }

  checkTopUp(BuildContext context) {
    final isValid = digicelFromKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    digicelFromKey.currentState!.save();
    Get.to(const MerchantPaymentScreen(),arguments: [digicelMerchantName,digicelMerchantCode,amount,"1"+phone]);


  }


}
