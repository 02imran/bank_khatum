import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/dashboard/dashboard.dart';
import 'package:wallet_merchant/size_config.dart';

import '../../constants.dart';
import '../../global.dart';
import '../../model/response/transaction-refund-response/TransactionRefundResponse.dart';

class RefundSuccessScreen extends StatelessWidget{
  const RefundSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var data=Get.arguments[0] as TransactionRefundResponse;
    var amount=Get.arguments[1];
    var toAccount=Get.arguments[2];

    return WillPopScope(
     onWillPop: () async => false,
     child: Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kColorPrimaryNew,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        title: const Text("Success"),
      ),
      body: Container(
        width: SizeConfig.screenWidth,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(30),),
            Image.asset("assets/images/ico_transaction_successful.png",height: getProportionateScreenHeight(60),width: getProportionateScreenWidth(60),),
            SizedBox(height: getProportionateScreenHeight(13),),
            const Text("Success",style: TextStyle(color: Colors.black,fontSize: 18),),
            SizedBox(height: getProportionateScreenHeight(13),),

            const Text("Your Refund Request Was \n Submitted",style: TextStyle(fontSize: 13),textAlign: TextAlign.center,),

            SizedBox(height: getProportionateScreenHeight(20),),
            Container(
              padding: const EdgeInsets.only(left:30,right: 30,top: 10,bottom: 10),
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
                      const Text("From Account"),
                      Text("+"+accountNumberGlobal,style: const TextStyle(color: Colors.black),textAlign: TextAlign.end),

                    ],
                  ),
                  const SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("Merchant Code"),
                       Text(accountCodeGlobal,style: const TextStyle(color: Colors.black),textAlign: TextAlign.end),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("Merchant Name"),

                       Text(accountNameGlobal,style: const TextStyle(color: Colors.black),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("Refund Amount"),
                       Text(amount+" XCD",style: const TextStyle(color: Colors.black),),

                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("To Account"),
                       Text("+"+toAccount,style: const TextStyle(color: Colors.black),),

                    ],
                  ),
                  const SizedBox(height: 10,),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  const [
                      Text("Point Reversal"),

                       Text("0",style: TextStyle(color: Colors.black),),

                    ],
                  ),

                ],
              ),

            ),
            SizedBox(height: getProportionateScreenHeight(20),),
            GestureDetector(
              onTap: (){
                Get.offAll(const Dashboard());
              },
              child: Container(
                width: getProportionateScreenWidth(130),
                padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                decoration: BoxDecoration(
                  color: buttonBackground,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Center(
                  child: Text("Done",style: TextStyle(color: Colors.white),),
                ),
              ),
            )


          ],
        ),
      ),
    ));

  }


}