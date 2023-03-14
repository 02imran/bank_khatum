import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wallet_merchant/screen/create-customer/component/first_name_field.dart';
import 'package:wallet_merchant/screen/create-customer/component/gender_drop_down.dart';
import 'package:wallet_merchant/screen/create-customer/component/last_name_field.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'component/dob_field.dart';
import 'controller/create_customer_controller.dart';

class CreateCustomerForm extends GetView<CreateCustomerController> {
  const CreateCustomerForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<CreateCustomerController>(
      () => CreateCustomerController(),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        title: const Text(
          "Customer Registration",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          width: SizeConfig.screenWidth,
          child: Form(
              key: controller.createCustomerSubmitFromKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  RichText(
                    text: const TextSpan(
                      text: 'FIRST NAME',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: '*', style: TextStyle(color: kColorPrimary)),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  const FirstNameField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  RichText(
                    text: const TextSpan(
                      text: 'LAST NAME',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: '*', style: TextStyle(color: kColorPrimary)),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  const LastNameField(),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  RichText(
                    text: const TextSpan(
                      text: 'GENDER',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: '*', style: TextStyle(color: kColorPrimary))
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  const GenderDropDown(),
                  SizedBox(
                    height: getProportionateScreenHeight(30)
                  ),
                  RichText(
                    text: const TextSpan(
                      text: 'DATE OF BIRTH',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: '*', style: TextStyle(color: kColorPrimary))
                      ],
                    ),
                  ),
                  SizedBox(
                      height: getProportionateScreenHeight(20)
                  ),


                const  DateOfBirthField(),
                  SizedBox(
                      height: getProportionateScreenHeight(30)
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.confirmCustomerRegistration(context);
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Container(
                      width: getProportionateScreenWidth(300),
                      height: getProportionateScreenHeight(50),
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kColorPrimary),
                      child: const Center(
                        child: Center(
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
