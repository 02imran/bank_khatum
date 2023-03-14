import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyQrCodeController extends GetxController with StateMixin {


  late TextEditingController amountController;
  var amount = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    amountController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    amountController.dispose();
  }




}