import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


import '../../../constants.dart';
import '../controller/create_customer_controller.dart';

class BuildPhoneCodeFormField extends GetView<CreateCustomerController>{

  const BuildPhoneCodeFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.phoneController,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'^0+')),
      ],
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