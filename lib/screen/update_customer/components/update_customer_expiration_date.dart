

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../controller/update_customer_controller.dart';

class UpdateCustomerExpirationDate extends GetView<UpdateCustomerController> {
  const UpdateCustomerExpirationDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        RichText(
          text: const TextSpan(
            text: 'VALID TILL',

            style: TextStyle(fontSize: 16, color: kTextColor, ),
            children: <TextSpan>[
              TextSpan(
                  text: '  *\n', style: TextStyle(color: kColorPrimary)),
              TextSpan(text: 'Expiration Date'),
            ],
          ),
        ),
        const Spacer(),
        Obx(() => InkWell(
          onTap: () {
            controller.chooseExpireDate();
          },
          child: Container(
            height: getProportionateScreenHeight(55),
            width: SizeConfig.screenWidth! * 0.5,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                border: Border.all(color: Colors.black)),
            child: Row(

              children: [
                const  SizedBox(width: 10),
                Text(
                  DateFormat("dd-MM-yyyy")
                      .format(controller.expierDate.value)
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
        ))
      ],
    );
  }
}
