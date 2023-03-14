import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/login/controller/login_controller.dart';
import 'package:wallet_merchant/screen/otp/controller/otp_controller.dart';

import '../../../constants.dart';

class BuildOtpFormField extends GetView<OtpController>{

  const BuildOtpFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white,fontSize: 17),
      autofocus: false,
      keyboardType: TextInputType.phone,
      maxLength: 6,
      obscureText: true,
      onSaved: (value) {
        controller.otp = value!;
      },
      validator: (value) {
        return controller.validateOtp(value!);
      },
      decoration: InputDecoration(
        counterText: "",
        hintStyle: const TextStyle(color: Colors.white),
        labelStyle: const TextStyle(color: Colors.white),
        hintText: " Enter your otp",
        floatingLabelBehavior: FloatingLabelBehavior.always,
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