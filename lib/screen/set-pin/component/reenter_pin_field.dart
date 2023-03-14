import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/set-pin/controller/set_pin_controller.dart';


import '../../../constants.dart';

class BuildReEnterPinFormField extends GetView<SetPinController>{

  const BuildReEnterPinFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.reEnterPinController,
      style: const TextStyle(color: kTextColor,fontSize: 17),
      autofocus: false,
      obscureText: true,
      keyboardType: TextInputType.phone,
      maxLength: 4,
      onSaved: (value) {
        controller.reEnterPin = value!;
      },
      validator: (value) {
        return controller.validateNewPin(value!);
      },
      decoration: const InputDecoration(
        counterText: "",
        labelText: "Re-Enter New 4-Digit PIN",
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