import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/constants.dart';
import '../controller/update_customer_controller.dart';

class UpdateCustomerFirstNameField extends GetView<UpdateCustomerController>{

  const UpdateCustomerFirstNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.firstNameController,
      style: const TextStyle(color: kTextColor,fontSize: 16),
      autofocus: false,
      readOnly: true,
      keyboardType: TextInputType.text,
      maxLength: 20,
      onSaved: (value) {
        controller.firstName = value!;
      },
      validator: (value) {
        return controller.validateFirstName(value!);
      },
      decoration: InputDecoration(
        counterText: "",
        // labelText: "First Name",
        hintStyle: const TextStyle(color: Colors.black),
        labelStyle: const TextStyle(color: Colors.black),
        hintText: "Enter Your First Name",
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