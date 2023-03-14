import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/login/controller/login_controller.dart';

import '../../../constants.dart';

class BuildPhoneFormField extends GetView<LoginController>{

  const BuildPhoneFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.phoneController,
      style: const TextStyle(color: Colors.white,fontSize: 17),
      autofocus: false,
      keyboardType: TextInputType.phone,
      maxLength: 10,
      onSaved: (value) {
        controller.phone = value!;
      },
      validator: (value) {
        return controller.validatePhone(value!);
      },
      decoration: InputDecoration(
        counterText: "",
        labelText: "Phone",
        hintStyle: const TextStyle(color: Colors.white),
        labelStyle: const TextStyle(color: Colors.white),
        hintText: " Enter Your Phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixText: countryCodePrefix,
        prefixStyle: const TextStyle(color: Colors.white,fontSize: 17),
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(15, 30, 30, 0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }

}