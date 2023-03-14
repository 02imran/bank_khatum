

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/constants.dart';
import 'package:wallet_merchant/screen/update_customer/controller/update_customer_controller.dart';

import '../../../size_config.dart';

class UpdateCustomerLegalIdentification extends GetView<UpdateCustomerController> {
  const UpdateCustomerLegalIdentification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField(
        isExpanded: true,
        hint: const Text('Select Id Type',
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
        items: controller.idTypeList.value
            .map((idType) {

          return DropdownMenuItem<String>(
            value: idType.id,
            child: Text(idType.name.toString(),
                style: const TextStyle(
                    fontSize: 14, color: kTextColor)),
          );
        }).toList(),
        validator: (value) {
          if (value == null) return "Id Type is required";
          return null;
        },

        onChanged: (value) {
          for(var idType in controller.idTypeList.value){
            if(idType.id.toString() == value){
              controller.chooseIdtype.value = idType.id ?? '';
            }
          }
        },
      ),
    );
  }
}
