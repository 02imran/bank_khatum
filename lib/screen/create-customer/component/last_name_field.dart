import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/login/controller/login_controller.dart';

import '../../../constants.dart';
import '../controller/create_customer_controller.dart';

class LastNameField extends GetView<CreateCustomerController>{

  const LastNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.lastNameController,
      style: const TextStyle(color: Colors.black,fontSize: 17),
      autofocus: false,
      keyboardType: TextInputType.text,
      maxLength: 20,
      onSaved: (value) {
        controller.lastName = value!;
      },
      validator: (value) {
        return controller.validateLastName(value!);
      },
      decoration: InputDecoration(
        counterText: "",
        // labelText: "Last Name",
        hintStyle: const TextStyle(color: Colors.black),
        labelStyle: const TextStyle(color: Colors.black),
        hintText: "Enter Your Last Name",
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