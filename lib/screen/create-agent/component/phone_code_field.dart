import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/create-agent/controller/create_agent_controller.dart';


import '../../../constants.dart';

class BuildPhoneCodeFormField extends GetView<CreateAgentController>{

  const BuildPhoneCodeFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.phoneController,
      style: const TextStyle(color: kTextColor,fontSize: 17),
      autofocus: false,
      keyboardType: TextInputType.phone,
      maxLength: 10,
      onSaved: (value) {
        controller.phone = value!;
      },
      validator: (value) {
        return controller.validatePhone(value!);
      },
      decoration: const InputDecoration(
        counterText: "",
        labelText: "Mobile Number",
        prefixText: countryCodePrefix,
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