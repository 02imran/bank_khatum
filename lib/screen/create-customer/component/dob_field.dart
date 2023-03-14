import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../size_config.dart';
import '../controller/create_customer_controller.dart';

class DateOfBirthField extends GetView<CreateCustomerController>{

  const DateOfBirthField({Key? key}) : super(key: key);

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
              DateFormat("dd-MM-yyyy")
                  .format(controller.dobDate.value)
                  .toString(),

              style: const TextStyle(
                  fontSize:16, color: Colors.black
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