import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/constants.dart';
import '../../../size_config.dart';
import '../controller/update_customer_controller.dart';

class UpdateCustomerGenderDropDown extends  GetView<UpdateCustomerController>{
  const UpdateCustomerGenderDropDown({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(15), right: getProportionateScreenWidth(30)),
        width: SizeConfig.screenWidth,
        height: getProportionateScreenHeight(57),
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            border: Border.all(color: Colors.black)),
        child: DropdownButton<String>(
          // hint: Text('Select Gender'),
          isExpanded: true,

          dropdownColor: Colors.white,
          underline: Container(),
          // icon: const Visibility(visible: false, child: Icon(Icons.arrow_drop_down)),
          value: controller.selectGender.value,
          //elevation: 5,
          style: const TextStyle(
              color: kTextColor,fontSize: 14),
           items: controller.genderList.map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            controller.selectGender.value=value!;
          },
        )));
  }

}