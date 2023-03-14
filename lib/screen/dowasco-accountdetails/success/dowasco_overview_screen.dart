import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/size_config.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';
import '../../../global.dart';
import '../../merchant-payment/merchant_payment.dart';
import 'controller/dowasco_details_controller.dart';


class DowascoOverviewScreen extends GetView<DowascoDetailsController>{
  const DowascoOverviewScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Get.lazyPut<DowascoDetailsController>(
          () => DowascoDetailsController(),
    );
    var accountNumber=Get.arguments[0];
    return  Scaffold(

      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        title: const Text("Overview"),
      ),
      body: Container(
        width: SizeConfig.screenWidth,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(30),),
             Obx(()=> controller.getAccountDetailsResponse.value.issuccess == true?Container(
              padding: const EdgeInsets.only(left:10,right: 10,top: 10,bottom: 10),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                color: stroke,
                border: Border.all(color: Colors.grey,)
              ),

              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("Customer Name:"),
                      Obx(()=>
                           SizedBox(width:getProportionateScreenWidth(200),child: Text(controller.getAccountDetailsResponse.value.payload!.customerLastName!,style: const TextStyle(color: Colors.black,fontSize: 12),textAlign: TextAlign.end)),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("Billing Address:"),
                      Obx(()=>
                       SizedBox(width:getProportionateScreenWidth(200),child: Text(controller.getAccountDetailsResponse.value.payload!.billingAddress!,style: const TextStyle(color: Colors.black,fontSize: 12),textAlign: TextAlign.end)),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("Customer Phone Number:"),
                      Obx(()=>
                       Text("+1"+controller.getAccountDetailsResponse.value.payload!.customerPhoneNumber!,style: const TextStyle(color: Colors.black,fontSize: 12),),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("Account Number:"),
                      Obx(()=>
                       Text(controller.getAccountDetailsResponse.value.payload!.accountNumber!,style: const TextStyle(color: Colors.black,fontSize: 12),),
                      )

                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("Last Payment Date:"),
                      Obx(()=>
                       Text(DateFormat.MMMMd().format(DateTime.parse(controller.getAccountDetailsResponse.value.payload!.lastPaymentDate!)),style: const TextStyle(color: Colors.black,fontSize: 12),),
                      )

                    ],
                  ),
                  const SizedBox(height: 10,),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("Last Payment Amount:"),
                      Obx(()=>
                       Text(controller.getAccountDetailsResponse.value.payload!.lastPaymentAmount!,style: const TextStyle(color: Colors.black,fontSize: 12),),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("Amount Due:"),
                      Obx(()=>
                       Text(controller.getAccountDetailsResponse.value.payload!.totalBalance!,style: const TextStyle(color: Colors.black,fontSize: 12),),
                      )
                    ],
                  ),

                ],
              ),

            ):Container()),
            SizedBox(height: getProportionateScreenHeight(20),),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){

                    Get.to(const MerchantPaymentScreen(),arguments: [dowascoMerchantName,dowascoMerchantCode,controller.getAccountDetailsResponse.value.payload!.totalBalance!,accountNumber]);
                  },
                  child: Container(
                    width: getProportionateScreenWidth(160),
                    height: getProportionateScreenHeight(50),
                    margin: const EdgeInsets.only(left: 5,right: 5),
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: colorOrange
                    ),
                    child: const Center(child: Center(child:Text("Partial Payment",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(const MerchantPaymentScreen(),arguments: [dowascoMerchantName,dowascoMerchantCode,controller.getAccountDetailsResponse.value.payload!.totalBalance!,accountNumber]);
                  },
                  child: Container(
                    width: getProportionateScreenWidth(160),
                    height: getProportionateScreenHeight(50),
                    margin: const EdgeInsets.only(left: 5,right: 5),
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kColorPrimary
                    ),
                    child: const Center(child: Center(child:Text("Full Payment",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );

  }


}