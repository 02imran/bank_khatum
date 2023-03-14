import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/size_config.dart';

import '../../../constants.dart';
import '../../dashboard/dashboard.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var member = Get.arguments[0];
    var amount = Get.arguments[1];
    var point = Get.arguments[2];
    var merchant = Get.arguments[3];
    var expire = Get.arguments[4];
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(title: Text('Success'),
        backgroundColor: kColorPrimaryNew,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),
      bottomNavigationBar: Container(
        height: SizeConfig.screenHeight! * 0.6,
        width: SizeConfig.screenWidth,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFE5EEEC),
              blurRadius: 1,
              spreadRadius: 1,
              offset: Offset(1, -3),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(38)),
            const Text(
              'Congratulations!',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            SizedBox(height: getProportionateScreenHeight(18)),
            Image.asset(
              'assets/icons/success_reedem.png',
              height: getProportionateScreenHeight(95),
              width: getProportionateScreenWidth(95),
            ),
            SizedBox(height: getProportionateScreenHeight(14)),
            const Text(
              'Voucher Purchase Successful',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF535252)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(14),
                  vertical: getProportionateScreenHeight(10)),
              child: Container(
                // height: getProportionateScreenHeight(121),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFF1ECED)),
                  color: Colors.white,
                ),
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenHeight(14),
                    vertical: getProportionateScreenHeight(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Member ID           :  ',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.grey),
                        ),
                        Text(
                          '$member',
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(7)),
                    Row(
                      children: [
                        const Text(
                          'Amount                :  ',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.grey),
                        ),
                        Text(
                          '$amount',
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(7)),
                    Text(
                      'Points Required    :  $point',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                    SizedBox(height: getProportionateScreenHeight(7)),
                    Text(
                      'Merchant Name   :  $merchant',
                      style: const  TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                    SizedBox(height: getProportionateScreenHeight(7)),
                    Row(
                      children: [
                        const Text(
                          'Expiry Date           : ',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.grey),
                        ),
                        Text(
                          '$expire',
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.grey),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(20),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  Get.offAll(()=>const Dashboard());
                },
                child: Container(
                  width: SizeConfig.screenWidth,
                  height: getProportionateScreenHeight(50),
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                      boxShadow:  [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: Offset(1, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue),
                  child: const Center(
                    child: Center(
                      child: Text(
                        'Back to Home',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight! * 0.14,),
          const Center(
            child:  Text(
              'Voucher Purchase Successful',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF535252)),
            ),
          ),
        ],
      ),

    );
  }
}
