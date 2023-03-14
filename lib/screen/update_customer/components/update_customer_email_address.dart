

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../controller/update_customer_controller.dart';

class UpdateCustomerEmailField extends GetView<UpdateCustomerController>{

  const UpdateCustomerEmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.emailController,
      style: const TextStyle(color: Colors.black,fontSize: 17),
      autofocus: false,
      keyboardType: TextInputType.text,
      maxLength: 50,
      onSaved: (value) {
        controller.email = value!;
      },
      // validator: (value) {
      //   return controller.emailValidate(value!);
      // },
      decoration: InputDecoration(
        counterText: "",

        hintStyle: const TextStyle(color: kTextColor, fontSize: 14),
        labelStyle: const TextStyle(color: Colors.black),
        hintText: "Enter Your Email",
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