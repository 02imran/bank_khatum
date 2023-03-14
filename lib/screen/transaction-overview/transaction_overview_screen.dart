import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wallet_merchant/model/response/aml/AmlResponse.dart';
import 'package:wallet_merchant/size_config.dart';

import '../../constants.dart';
import '../../shared_prefs_helper.dart';
import '../dashboard/controller/dashboard_controller.dart';
import '../topup/controller/cash_in_controller.dart';
import 'controller/overview_controller.dart';

class TransactionOverviewScreen extends GetView<TransactionOverviewController> {
   TransactionOverviewScreen({Key? key}) : super(key: key);

  final dashboardController = Get.find<DashboardController>();
  final cashInController = Get.put<CashInController>(CashInController());

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments[0] as AmlResponse;
    var pin = Get.arguments[1];
    var reference = Get.arguments[2];
    var keyWord = Get.arguments[3];
    var destination = Get.arguments[6];
    Get.lazyPut<TransactionOverviewController>(
          () => TransactionOverviewController(),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        title: const Text("Transaction Overview"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text("From Account",style: TextStyle(fontSize: 17),),
                  Text("+"+"${data.msisdn! ==''?destination:data.msisdn!}",style: const TextStyle(color: Colors.black,fontSize: 15),),
              SizedBox(height: getProportionateScreenHeight(10),),
              Container(
                height: 1,
                width: SizeConfig.screenWidth,
                color: stroke,
              ),
              SizedBox(height: getProportionateScreenHeight(20),),
              const Text("Destination Account",style: TextStyle(fontSize: 17),),

                  Text("+"+"${data.destinationMsisdn==''?destination:data.destinationMsisdn!}",style: const TextStyle(color: Colors.black,fontSize: 15),),

              SizedBox(height: getProportionateScreenHeight(10),),
              Container(
                height: 1,
                width: SizeConfig.screenWidth,
                color: stroke,
              ),
              SizedBox(height: getProportionateScreenHeight(20),),

              keyWord == 'DCAS'? const Text("Cash Out Amount",style: TextStyle(fontSize: 17),): keyWord == 'MGIV'? const Text("Cash Out Amount",style: TextStyle(fontSize: 17),): dashboardController.userType.value =="Agent"?   const Text("Top Up Amount",style: TextStyle(fontSize: 17),):  keyWord == 'PMNT'? const Text("Amount",style: TextStyle(fontSize: 17),):   const Text("Cash Out Payment",style: TextStyle(fontSize: 17),),

              Text(NumberFormat("#,###").format(int.parse(data.amount!))+" XCD",style: const TextStyle(color: Colors.black,fontSize: 15),),

              SizedBox(height: getProportionateScreenHeight(10),),
              Container(
                height: 1,
                width: SizeConfig.screenWidth,
                color: stroke,
              ),

              dashboardController.userType.value =="Agent"?  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: getProportionateScreenHeight(20),),

                  const Text("Fee Charge",style: TextStyle(fontSize: 17),),

                  Text(NumberFormat("#,###").format(int.parse(data.chargeAmount!))+" XCD",style: const TextStyle(color: Colors.black,fontSize: 15),),

                  SizedBox(height: getProportionateScreenHeight(10),),
                  Container(
                    height: 1,
                    width: SizeConfig.screenWidth,
                    color: stroke,
                  ),
                ],
              ): keyWord == 'MGIV'?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: getProportionateScreenHeight(20),),

                  const Text("Fee Charge Amount",style: TextStyle(fontSize: 17),),

                  Text(NumberFormat("#,###").format(int.parse(data.chargeAmount!))+" XCD",style: const TextStyle(color: Colors.black,fontSize: 15),),

                  SizedBox(height: getProportionateScreenHeight(10),),
                  Container(
                    height: 1,
                    width: SizeConfig.screenWidth,
                    color: stroke,
                  ),
                ],
              ): Container(),
              SizedBox(height: getProportionateScreenHeight(20),),
              const Text("Total Amount",style: TextStyle(fontSize: 17),),

              keyWord == 'MGIV'?  Text(NumberFormat("#,###").format((int.parse(data.amount!) + int.parse(data.chargeAmount!)))+" XCD",style: const TextStyle(color: Colors.black,fontSize: 15),):
              Text(NumberFormat("#,###").format((int.parse(data.amount!)))+" XCD",style: const TextStyle(color: Colors.black,fontSize: 15),),

              SizedBox(height: getProportionateScreenHeight(10),),

              Container(
                height: 1,
                width: SizeConfig.screenWidth,
                color: stroke,
              ),
              keyWord == 'CASH'? const SizedBox(): dashboardController.userType.value =="Agent"?    Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [SizedBox(height: getProportionateScreenHeight(20),),
                  const Text("Commission Earned",style: TextStyle(fontSize: 17),),

                  Text(NumberFormat("#,###").format((int.parse(data.commissionAmount!) + int.parse(data.chargeAmount!)))+" XCD",style: const TextStyle(color: Colors.black,fontSize: 15),),


                  SizedBox(height: getProportionateScreenHeight(10),),
                  Container(
                    height: 1,
                    width: SizeConfig.screenWidth,
                    color: stroke,
                  ),

                ],
              ): const SizedBox(),
              SizedBox(height: getProportionateScreenHeight(20),),
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
                          borderRadius: BorderRadius.circular(30),
                          color: colorOrange
                      ),
                      child: const Center(child: Center(child:Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      SharedPrefsHelper.getMsisdn().then((msisdn) {

                        if(msisdn==data.destinationMsisdn!){
                          controller.doTransaction(data.keyword!,data.destinationMsisdn!,data.amount.toString(),pin,reference,data.msisdn!);
                        }else{
                          controller.doTransaction(data.keyword!,data.destinationMsisdn!,data.amount.toString(),pin,reference,"");
                        }

                      });

                    },
                    child: Container(
                      width: getProportionateScreenWidth(140),
                      height: getProportionateScreenHeight(40),
                      margin: const EdgeInsets.only(left: 5,right: 5),
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kButtonColor
                      ),
                      child: const Center(child: Center(child:Text("Confirm",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }


}