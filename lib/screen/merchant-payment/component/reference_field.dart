import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../constants.dart';
import '../controller/merchant_payment_controller.dart';

class BuildReferenceFormField extends GetView<MerchantPaymentController>{

  const BuildReferenceFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.referenceController,
      style: const TextStyle(color: kTextColor,fontSize: 17),
      autofocus: false,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        controller.reference = value!;
      },
      validator: (value) {
        return controller.validateReference(value!);
      },
      decoration: const InputDecoration(
        counterText: "",
        labelText: "Enter Reference Value",
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