

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/constants.dart';
import 'package:wallet_merchant/screen/update_customer/controller/update_customer_controller.dart';

import '../../../size_config.dart';

class UpdateCustomerCity extends GetView<UpdateCustomerController> {
  const UpdateCustomerCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButtonHideUnderline(
      child: DropdownButtonFormField(
        isExpanded: true,
        hint: const Text('Select Your City',
            style: TextStyle(fontSize: 14, color: kTextColor)),
        // icon: const Icon(Icons.arrow_drop_down),

        decoration: InputDecoration(
          counterText: "",
          // labelText: "First Name",
          hintStyle: const TextStyle(color: Colors.black),
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
        ),
        items: controller.cityList.value
            .map((city) {
          return DropdownMenuItem<String>(
            value: city.cityId.toString(),
            child: Text(city.cityNameEnglish.toString(),
                style: const TextStyle(
                    fontSize: 14, color: kTextColor)),
          );
        }).toList(),
        validator: (value) {
          if (value == null) return "City is required";
          return null;
        },
        onChanged: (value) {
          controller.cityOnchange(value);
        },
      ),
    ));
  }
}
