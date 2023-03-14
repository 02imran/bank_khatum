import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/balance/controller/balance_controller.dart';
import 'package:wallet_merchant/size_config.dart';

import '../../constants.dart';

class BalanceScreen extends GetView<BalanceController>{
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Get.lazyPut<BalanceController>(
          () => BalanceController(),
    );

   return Scaffold(
     appBar: AppBar(
       backgroundColor: kColorPrimaryNew,
       iconTheme: const IconThemeData(
           color: Colors.white
       ),
       title: const Text("Balance"),
     ),

     body: Column(
       children: [
         SizedBox(height: getProportionateScreenHeight(60),),
         Container(
           padding: const EdgeInsets.only(top: 20,bottom: 20),
           color: const Color(0xFFEFEFEF),
           width: SizeConfig.screenWidth,
           child: Column(
             children: [
               const Text("My Total Balance",style: TextStyle(fontSize: 15),),
               SizedBox(height: getProportionateScreenHeight(10),),
             Obx(() =>
             controller.balance.value.isNotEmpty? Text(controller.format.format(int.parse('${controller.balance.value}'))+" XCD",style: const TextStyle(fontSize: 16,color: kColorPrimaryNew) ,): Container(),
             )
             ],
           )
         )
       ],
     ),

   );
  }

}