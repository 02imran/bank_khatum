import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/dashboard/controller/dashboard_controller.dart';
import 'package:wallet_merchant/screen/get-payment/get_payment_screen.dart';
import 'package:wallet_merchant/size_config.dart';

import '../../../../../constants.dart';

class GetPayment extends GetView<DashboardController> {
  const GetPayment({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 25,left: 15,right: 15),
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            GestureDetector(
            onTap: (){
              Get.to(const GetPaymentScreen());
            },
            child:Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: stroke),
                borderRadius: const BorderRadius.all(Radius.circular(5))

              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/payment.svg",
                    color: kColorPrimary,
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(width: 30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("MERCHANT PAYMENT",style: TextStyle(color: Colors.black,fontSize: 18),),
                      Text("Receive Payment From Customer",style: TextStyle(color: Colors.black,fontSize: 13),),
                    ],
                  )
                ],
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }

}