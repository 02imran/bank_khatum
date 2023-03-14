import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wallet_merchant/constants.dart';
import '../../../size_config.dart';
import '../controller/update_customer_controller.dart';

class UpdateCustomerDateOfBirthField extends GetView<UpdateCustomerController>{

  const UpdateCustomerDateOfBirthField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
      onTap: () {
        controller.chooseDate();
      },
      child: Container(
        height: getProportionateScreenHeight(55),
        width: SizeConfig.screenWidth,
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            border: Border.all(color: Colors.black)),
        child: Row(

          children: [
            const  SizedBox(width: 10),
            Text(
              DateFormat("yyyy-MM-dd")
                  .format(controller.dobDate.value)
                  .toString(),

              style: const TextStyle(
                  fontSize:16, color: kTextColor
              ),
            ),
            const Spacer(),
            Padding(
                padding: EdgeInsets.all(
                    getProportionateScreenHeight(9)),
                child:const Icon(Icons.calendar_today)),
          ],
        ),
      ),
    ));
  }

}