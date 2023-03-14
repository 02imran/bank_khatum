import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../controller/merchant_payment_dowasco_other_controller.dart';

class ReferenceDropDown extends  GetView<MerchantPaymentDowascoOtherController>{
  const ReferenceDropDown({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
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
              padding: EdgeInsets.only(left: getProportionateScreenHeight(0)),
              child: Row(
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth! - 60,
                    height: getProportionateScreenHeight(30),
                    child: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      underline: Container(),
                      icon: const Visibility(visible: false, child: Icon(Icons.arrow_drop_down)),
                      value: controller.reference.value,
                      //elevation: 5,
                      style: const TextStyle(
                          fontSize: 17,
                          color: kTextColor),
                       items: controller.referenceList.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.reference.value=value!;
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
        )));
  }

}