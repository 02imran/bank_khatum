import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/create-agent/controller/create_agent_controller.dart';

import '../../../constants.dart';

class BuildNameFormField extends GetView<CreateAgentController>{

  const BuildNameFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.nameController,
      style: const TextStyle(color: kTextColor,fontSize: 17),
      autofocus: false,
      keyboardType: TextInputType.text,
      maxLength: 15,
      onSaved: (value) {
        controller.name = value!;
      },
      validator: (value) {
        return controller.validateName(value!);
      },
      decoration: const InputDecoration(
        counterText: "",
        labelText: "Enter Full Name",
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