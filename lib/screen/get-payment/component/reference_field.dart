import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/get-payment/controller/get_payment_controller.dart';
import 'package:wallet_merchant/screen/login/controller/login_controller.dart';
import 'package:wallet_merchant/screen/merchant-cashout/controller/merchant_cashout_controller.dart';

import '../../../constants.dart';

class BuildReferenceFormField extends GetView<GetPaymentController>{

  const BuildReferenceFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.referenceController,
      style: const TextStyle(color: kTextColor,fontSize: 17),
      autofocus: false,
      keyboardType: TextInputType.text,
      maxLength: 15,
      onSaved: (value) {
        controller.reference = value!;
      },
      validator: (value) {
        return controller.validateReference(value!);
      },
      decoration: const InputDecoration(
        counterText: "",
        labelText: "Enter reference value",
        labelStyle: TextStyle(color: kTextColor),
        contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 0),
        enabledBorder: UnderlineInputBorder(),
        border: UnderlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid,color: kColorPrimary)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid,color: kColorPrimary)),
        errorBorder: UnderlineInputBorder(borderSide: BorderSide(
          color: Colors.red,
        ),),
        focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(
          color: Colors.red,
        ),),
      ),
    );
  }

}