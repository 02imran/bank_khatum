import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/component/AvatarLetter.dart';
import 'package:wallet_merchant/constants.dart';
import 'package:wallet_merchant/screen/dashboard/controller/dashboard_controller.dart';
import 'package:wallet_merchant/screen/merchant-cashout/merchant_cashout_screen.dart';
import 'package:wallet_merchant/size_config.dart';

import '../../../balance/balance_screen.dart';
import '../../../get-payment/get_payment_screen.dart';
import '../../../transaction-history/transaction_history_screen.dart';
import '../purchase/purchase.dart';

class MerchantHome extends GetView<DashboardController> {
  const MerchantHome({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: ListView(
        children:  [
          SizedBox(height: getProportionateScreenHeight(40),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: SizeConfig.screenWidth,
              padding: const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
              decoration: BoxDecoration(

                image: const DecorationImage(image: AssetImage('assets/images/Balance_Card.png'), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(30)
              ),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 2, color: Colors.white)
                        ),
                        child: const CircleAvatar(
                          maxRadius: 28,
                          backgroundImage: AssetImage('assets/icons/user_icon_default.jpg'),
                        ),
                      ),

                    // Obx(() =>   controller.isCashOut.value == true?   GestureDetector(
                    //     onTap: (){
                    //       Get.to(const MerchantCashOutScreen());
                    //     },
                    //     child: Column(
                    //       children: [
                    //         Container(
                    //           height: getProportionateScreenHeight(25),
                    //           width: getProportionateScreenWidth(25),
                    //           decoration:  BoxDecoration(shape: BoxShape.circle, color: const Color(0xFFE8FFF1),
                    //               border: Border.all(
                    //                   color: const Color(0xFF448D34)
                    //               )),
                    //           child: const Icon(Icons.exit_to_app, size: 10,color: kColorPrimary,),
                    //         ),
                    //        const Text('Cash Out', style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.w400),)
                    //       ],
                    //     ),
                    //   ): Container())
                    ],
                  ),
                  SizedBox(height: getProportionateScreenWidth(5)),
                  const Text("Wallet ID:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 12),),

                  Obx(() =>
                      Text(controller.walletId.value,style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12),),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Name", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 12),),

                          Obx(() =>
                              Text(controller.fullNameFromResponse.value,style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12),),
                          ),
                        ],
                      ),
                     const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text("Merchant ID", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,fontSize: 12),),

                          Obx(() =>
                              Text(controller.accountCode.value,style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12),),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Get.to(const GetPaymentScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
                  width: SizeConfig.screenWidth! * 0.5,
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(width: 0.3), right: BorderSide(width: 0.3))
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/images/get_payment.png', height: getProportionateScreenHeight(70), width: getProportionateScreenWidth(70),),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      const Text(
                        "Merchant Payment",
                        style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: getProportionateScreenHeight(3)),
                      const  Text(
                        "Receive Payment From Customer",
                        style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Get.to(const Purchase());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
                  width: SizeConfig.screenWidth! * 0.5,
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(width: 0.3))
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/images/transaction.png', height: getProportionateScreenHeight(70), width: getProportionateScreenWidth(70),),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      const Text(
                        "Purchase",
                        style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: getProportionateScreenHeight(3)),
                      const  Text(
                        "Make Purchase",
                        style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.w400),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Get.to( TransactionHistoryScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
                  width: SizeConfig.screenWidth! * 0.5,
                  decoration: const BoxDecoration(
                      border: Border( right: BorderSide(width: 0.3))
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/images/report.png', height: getProportionateScreenHeight(70), width: getProportionateScreenWidth(70),),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      const Text(
                        "Transaction",
                        style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: getProportionateScreenHeight(3)),
                      const  Text(
                        "View Transaction History",
                        style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() => GestureDetector(
                onTap: (){
                  Get.to(const BalanceScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
                  width: SizeConfig.screenWidth! * 0.5,
                  decoration:  BoxDecoration(
                      border: controller.isCashOut.value ? const Border(bottom: BorderSide(width: 0.3)): null
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/images/balance-check.png', height: getProportionateScreenHeight(70), width: getProportionateScreenWidth(70),),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      const Text(
                        "Balance",
                        style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: getProportionateScreenHeight(3)),
                      const  Text(
                        "Check Your Balance",
                        style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.w400),
                      ),

                    ],
                  ),
                ),
              ),)
            ],
          ),
          Obx(() => controller.isCashOut.value? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Get.to(const MerchantCashOutScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
                  width: SizeConfig.screenWidth! * 0.5,
                  decoration: const BoxDecoration(
                      border: Border( right: BorderSide(width: 0.3), top: BorderSide(width: 0.3))
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/images/cash_out.png', height: getProportionateScreenHeight(70), width: getProportionateScreenWidth(70),),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      const Text(
                        "Cash Out",
                        style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: getProportionateScreenHeight(3)),
                      const  Text(
                        "Merchant Cash Out",
                        style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ): Container(),)
          // SizedBox(height: getProportionateScreenHeight(40),),
          // const Text("Welcome"),
          // SizedBox(height: getProportionateScreenHeight(5),),
          // Obx(() =>
          //  Text(controller.fullNameFromResponse.value,style: const TextStyle(color: kColorPrimary),),
          // ),
          // SizedBox(height: getProportionateScreenHeight(10),),
          // Obx(() =>
          // AvatarLetter(
          //   size: getProportionateScreenWidth(90),
          //   backgroundColor: kColorPrimary,
          //   textColor: Colors.white,
          //   fontSize: 35,
          //   upperCase: true,
          //   numberLetters: 2,
          //   letterType: LetterType.Circular,
          //   text: controller.fullNameFromResponse.value.isEmpty?"A":controller.fullNameFromResponse.value.replaceAll("-", " "),
          // ),
          // ),
          // SizedBox(height: getProportionateScreenHeight(20),),
          //
          // const Text("Wallet ID:"),
          // SizedBox(height: getProportionateScreenHeight(5),),
          // Obx(() =>
          //  Text(controller.walletId.value,style: const TextStyle(color: kColorPrimary),),
          // ),
          // SizedBox(height: getProportionateScreenHeight(20),),
          //
          // const Text("Merchant ID:"),
          // SizedBox(height: getProportionateScreenHeight(5),),
          // Obx(() =>
          //  Text(controller.accountCode.value,style: const TextStyle(color: kColorPrimary),),
          // ),
          // SizedBox(height: getProportionateScreenHeight(30),),
         //  Obx(() =>
         //  controller.isCashOut.value?GestureDetector(
         //    onTap: (){
         //      Get.to(const MerchantCashOutScreen());
         //    },
         //    child: Container(
         //      padding: const EdgeInsets.only(left: 15,right: 15,top: 7,bottom: 7),
         //      decoration: const BoxDecoration(
         //        color: kColorPrimary,
         //        borderRadius: BorderRadius.all(Radius.circular(10))
         //      ),
         //      child: const Text("Cash out",style: TextStyle(color: Colors.white),),
         //    ),
         //  ):Container()
         // )

      ],),
    );
  }

}
