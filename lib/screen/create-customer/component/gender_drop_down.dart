import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/model/response/create-agent/vat/VatSettingsResponse.dart';
import 'package:wallet_merchant/screen/create-agent/controller/create_agent_controller.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../controller/create_customer_controller.dart';

class GenderDropDown extends  GetView<CreateCustomerController>{
  const GenderDropDown({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        width: SizeConfig.screenWidth,
        height: getProportionateScreenHeight(57),
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            border: Border.all(color: Colors.black)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: getProportionateScreenHeight(10)),
              child: Row(
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth! - 70,
                    height: getProportionateScreenHeight(30),
                    child: DropdownButton<String>(
                      // hint: Text('Select Gender'),

                      dropdownColor: Colors.white,
                      underline: Container(),
                      icon: const Visibility(visible: false, child: Icon(Icons.arrow_drop_down)),
                      value: controller.selectGender.value,
                      //elevation: 5,
                      style: const TextStyle(
                          color: Colors.black,fontSize: 17),
                       items: controller.genderList.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.selectGender.value=value!;
                      },
                    ),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ],
        )));
  }

}