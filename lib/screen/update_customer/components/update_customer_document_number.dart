

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/constants.dart';
import '../controller/update_customer_controller.dart';

class UpdateCustomerDocumentNumber extends GetView<UpdateCustomerController>{

  const UpdateCustomerDocumentNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.documentController,
      style: const TextStyle(color: Colors.black,fontSize: 17),
      autofocus: false,
      keyboardType: TextInputType.text,
      maxLength: 16,
      onSaved: (value) {
        controller.documentNumber = value!;
      },
      validator: (value) {
        return controller.validDocumentNumber(value!);
      },
      decoration: InputDecoration(
        counterText: "",
        // labelText: "First Name",
        hintStyle: const TextStyle(color: kTextColor, fontSize: 14),
        labelStyle: const TextStyle(color: Colors.black),
        hintText: "Enter Your Document Number",

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
        // suffixIcon:  controller.documentController.text.length == 16 ? Icon(Icons.add): SizedBox()
      ),

    );

  }

}