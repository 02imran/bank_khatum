import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/size_config.dart';

import '../../constants.dart';
import '../../model/response/check-refund/CheckRefundResponse.dart';
import '../../shared_prefs_helper.dart';
import 'controller/refund_overview_controller.dart';

class RefundOverViewScreen extends GetView<RefundOverviewController> {
  const RefundOverViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments[0] as CheckRefundResponse;
    Get.lazyPut<RefundOverviewController>(
      () => RefundOverviewController(),
    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kColorPrimaryNew,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text("Transaction Overview"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Customer Name",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    data.destinationFullName!,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Container(
                    height: 1,
                    width: SizeConfig.screenWidth,
                    color: stroke,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  const Text(
                    "Customer Number",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    "+" + data.destinationMsisdn!,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Container(
                    height: 1,
                    width: SizeConfig.screenWidth,
                    color: stroke,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  const Text(
                    "Transaction ID",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    data.transactionId!,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Container(
                    height: 1,
                    width: SizeConfig.screenWidth,
                    color: stroke,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),

                  const Text(
                    "Refund Amount",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                     data.amount!,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Container(
                    height: 1,
                    width: SizeConfig.screenWidth,
                    color: stroke,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),

                  const Text(
                    "Point Reversal",
                    style: TextStyle(fontSize: 17),
                  ),
                  const Text(
                     "0",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Container(
                    height: 1,
                    width: SizeConfig.screenWidth,
                    color: stroke,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),

                  const Text(
                    "Reference ID",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    data.referenceId!,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Container(
                    height: 1,
                    width: SizeConfig.screenWidth,
                    color: stroke,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          width: getProportionateScreenWidth(140),
                          height: getProportionateScreenHeight(40),
                          margin: const EdgeInsets.only(left: 5,right: 5),
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: colorOrange
                          ),
                          child: const Center(child: Center(child:Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.refundTransaction(data.transactionId!,data.amount.toString(),data.destinationMsisdn!);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 5,right: 5),
                          width: getProportionateScreenWidth(150),
                          height: getProportionateScreenHeight(40),
                          margin: const EdgeInsets.only(left: 5,right: 5),
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kColorPrimary
                          ),
                          child: const Center(child: Center(child:Text("Refund Request",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
                        ),
                      )
                    ],
                  )
                ],
              )),
        ));
  }
}
