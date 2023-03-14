import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../controller/update_customer_controller.dart';

class BuildPhoneCodeFormFieldUpdateCustomerNew extends GetView<UpdateCustomerController>{

  const BuildPhoneCodeFormFieldUpdateCustomerNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.newPhoneController,
      readOnly: true,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'^0+')),
      ],
      style: const TextStyle(color: kTextColor,fontSize: 16),
      autofocus: false,
      keyboardType: TextInputType.phone,
      maxLength: 10,
      decoration: InputDecoration(
        counterText: "",
        hintStyle: const TextStyle(color: Colors.black),
        labelStyle: const TextStyle(color: Colors.black),
        hintText: "Enter Your Phone",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(15, 20, 30, 0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Colors.black,
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