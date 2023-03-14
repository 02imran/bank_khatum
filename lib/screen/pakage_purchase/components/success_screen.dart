import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/dashboard/dashboard.dart';
import 'package:wallet_merchant/size_config.dart';

import '../../../constants.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              'Pakage Purchase Successful',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF535252)),
            ),

            SizedBox(height: getProportionateScreenWidth(30),),
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
              'Package Purchase Successful',
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
