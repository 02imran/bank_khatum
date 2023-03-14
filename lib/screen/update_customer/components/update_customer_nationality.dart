

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/constants.dart';
import 'package:wallet_merchant/screen/update_customer/controller/update_customer_controller.dart';

import '../../../size_config.dart';

class UpdateCustomerNationality extends GetView<UpdateCustomerController> {
  const UpdateCustomerNationality({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField(
        isExpanded: true,
        hint: const Text('Select Your Nationality',
            style: TextStyle(fontSize: 14, color: kTextColor)),
        // icon: const Icon(Icons.arrow_drop_down),
        decoration: InputDecoration(
          counterText: "",
          // labelText: "First Name",
          hintStyle: const TextStyle(color: Colors.black),
          labelStyle: const TextStyle(color: Colors.black),
          // hintText: "Enter Your Document Number",
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
        items: controller.countryList.value
            .map((nationality) {
          return DropdownMenuItem<String>(
            value: nationality.id,
            child: Text(nationality.name.toString(),
                style: const TextStyle(
                    fontSize: 14, color: kTextColor)),
          );
        }).toList(),
        validator: (value) {
          if (value == null) return "Nationality is required";
          return null;
        },
        onChanged: (value) {
          for(var nationality in controller.countryList.value){
            if(nationality.id.toString() == value){
              controller.chooseNationality.value = nationality.id ?? '';
            }
          }

        },
      ),
    );
  }
}
