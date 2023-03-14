import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../constants.dart';
import '../controller/merchant_payment_controller.dart';

class BuildNameFormField extends GetView<MerchantPaymentController>{

  const BuildNameFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: controller.nameController,
      style: const TextStyle(color: kTextColor,fontSize: 17),
      autofocus: false,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        controller.name = value!;
      },
      validator: (value) {
        return controller.validateName(value!);
      },
      decoration: const InputDecoration(
        counterText: "",
        labelText: "Merchant Name",
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