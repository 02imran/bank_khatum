


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/update_customer/controller/update_customer_controller.dart';
import 'package:wallet_merchant/screen/update_customer/update_customer_form_field.dart';

import '../../constants.dart';
import '../../size_config.dart';


class UpdateCustomerInfo extends GetView<UpdateCustomerController>{
  const UpdateCustomerInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Get.lazyPut<UpdateCustomerController>(
          () => UpdateCustomerController(),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        title: const Text("Update Customer Information",style: TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),

      body: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          width: SizeConfig.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: getProportionateScreenWidth(20)),
              Container(
                decoration: BoxDecoration(border: Border.all(),),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const  Text('Name'),
                          Text(controller.responseName.value),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenWidth(10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         const Text('Phone Number'),
                          Text(mobilePrefix+controller.phone),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenWidth(10)),
                      Obx(() => controller.walletType.value.isNotEmpty ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          const Text('Wallet Type'),
                          Text(controller.walletType.value == '111' ? 'Unverified': 'Verified'),
                        ],
                      ):const Text(''))
                    ],
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              GestureDetector(
                onTap: (){
                  // controller.getCustomerProfile(context);
                  Get.to(()=> const UpdateCustomerFormField());

                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(

                    height: getProportionateScreenWidth(40),

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xFF8464BA)
                    ),
                    child: const Center(child: Text('Continue', style: TextStyle(color: Colors.white),)),
                  ),
                ),
              ),
            ],
          )

      ),

    );
  }


}