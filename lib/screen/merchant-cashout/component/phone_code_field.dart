import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/login/controller/login_controller.dart';
import 'package:wallet_merchant/screen/merchant-cashout/controller/merchant_cashout_controller.dart';

import '../../../constants.dart';

class BuildPhoneCodeFormField extends GetView<MerchantCashOutController>{

  const BuildPhoneCodeFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.phoneController,
      style: const TextStyle(color: kTextColor,fontSize: 17),
      autofocus: false,
      keyboardType: TextInputType.text,
      maxLength: 15,
      onSaved: (value) {
        controller.phone = value!;
      },
      validator: (value) {
        return controller.validatePhone(value!);
      },
      decoration: const InputDecoration(
        counterText: "",
        labelText: "Enter Agent Code/Mobile Number",
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