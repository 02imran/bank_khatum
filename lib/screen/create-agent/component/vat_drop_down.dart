import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/model/response/create-agent/vat/VatSettingsResponse.dart';
import 'package:wallet_merchant/screen/create-agent/controller/create_agent_controller.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class VatDropDown extends  GetView<CreateAgentController>{
  const VatDropDown({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.apiResponse.value.vatSettingLicensed!.isNotEmpty?Container(
        width: SizeConfig.screenWidth,
        height: getProportionateScreenHeight(54),
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.black))),
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
                    child: DropdownButton<VatSettingLicensed>(
                      dropdownColor: Colors.white,
                      underline: Container(),
                      icon: const Visibility(visible: false, child: Icon(Icons.arrow_drop_down)),
                      value: controller.chosenValueVatSettingLicensed.value.id != "" ? controller.chosenValueVatSettingLicensed.value : controller.apiResponse.value.vatSettingLicensed![0],
                      //elevation: 5,
                      style: const TextStyle(
                          color: kTextColor),
                       items: controller.apiResponse.value.vatSettingLicensed!.map<DropdownMenuItem<VatSettingLicensed>>((value) {
                        return DropdownMenuItem<VatSettingLicensed>(
                          value: value,
                          child: Text(value.description!),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.chosenValueVatSettingLicensed.value=value!;
                      },
                    ),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: kTextColor,
                  )
                ],
              ),
            ),
          ],
        )):Container());
  }

}