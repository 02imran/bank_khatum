import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/agent-merchant-cashout/agent_merchant_cash_out_screen.dart';
import 'package:wallet_merchant/screen/create-customer/create_customer_screen.dart';
import 'package:wallet_merchant/screen/dashboard/controller/dashboard_controller.dart';
import 'package:wallet_merchant/screen/get-payment/get_payment_screen.dart';
import 'package:wallet_merchant/screen/update_customer/update_customer_screen.dart';
import 'package:wallet_merchant/size_config.dart';

import '../../../../../constants.dart';
import '../../../../component/AvatarLetter.dart';
import '../../../balance-transfer/balance_transfer.dart';
import '../../../balance/balance_screen.dart';
import '../../../create-agent/create_agent_screen.dart';
import '../../../distributor-cashout/distributor_cashout.dart';
import '../../../redeem_points/redeem_points_scree.dart';
import '../../../topup/cash_in.dart';
import '../../../transaction-history/transaction_history_screen.dart';

class Service extends GetView<DashboardController> {
  const Service({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: ListView(
        children: [

          Container(

            width: SizeConfig.screenWidth,
            decoration:  BoxDecoration(

              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 5),
                )
              ],
              gradient: LinearGradient(
                colors: [kColorPrimary.withOpacity(0.7), kColorPrimary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              color: kColorPrimary,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(20)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      // Container(
                      //   decoration: BoxDecoration(
                      //       shape: BoxShape.circle,
                      //       border: Border.all(color: Colors.white, width: 2)
                      //
                      //   ),
                      //   child: AvatarLetter(
                      //     size: getProportionateScreenWidth(60),
                      //     backgroundColor: const Color(0xFF006496),
                      //     textColor: Colors.white,
                      //     fontSize: 35,
                      //     upperCase: true,
                      //     numberLetters: 2,
                      //     letterType: LetterType.Circular,
                      //     text: controller.fullNameFromResponse.value.isEmpty?"A":controller.fullNameFromResponse.value.replaceAll("-", " "),
                      //   ),
                      // ),
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
                      SizedBox(width: getProportionateScreenHeight(20)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(()=>
                              Text(controller.fullNameFromResponse.value,style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),),
                          ),
                          Obx(()=>
                              Text(controller.userType.value,style: const TextStyle(color: Colors.white, fontSize: 12),),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: getProportionateScreenHeight(10)),
                  Row(
                    children: [
                      Image.asset('assets/icons/phone-call.png', height: 18, width: 18,color: Colors.white,),
                      SizedBox(width: getProportionateScreenHeight(15)),
                      Obx(()=>
                          Text(controller.walletId.value,style: const TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.w400),),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Row(
                    children: [
                      Image.asset('assets/icons/agent_code.png', height: 20, width: 20,color: Colors.white,),
                      SizedBox(width: getProportionateScreenHeight(15)),
                      Obx(()=>
                          Text(controller.accountCode.value,style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
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
                  Get.to( CashInScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
                  width: SizeConfig.screenWidth! * 0.5,
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(width: 0.3), right: BorderSide(width: 0.3))
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/icons/Cash_In.png', height: getProportionateScreenHeight(70), width: getProportionateScreenWidth(70),),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      const Text(
                        "Cash In",
                        style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: getProportionateScreenHeight(3)),
                      const  Text(
                        "Sent Money To Customer",
                        style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Get.to(()=>const RedeemPointsScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
                  width: SizeConfig.screenWidth! * 0.5,
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(width: 0.3))
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/images/Voucher_Purchase.png', height: getProportionateScreenHeight(70), width: getProportionateScreenWidth(70),),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      const Text(
                        "Voucher Purchase",
                        style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: getProportionateScreenHeight(3)),
                      const  Text(
                        "Voucher Purchase",
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
                  Get.to(const AgentMerchantCashOutScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
                  width: SizeConfig.screenWidth! * 0.5,
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(width: 0.3), right: BorderSide(width: 0.3))
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/icons/merchant-cash-out.png', height: getProportionateScreenHeight(70), width: getProportionateScreenWidth(70),),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      const Text(
                        "Merchant Cash Out",
                        style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: getProportionateScreenHeight(3)),
                      const  Text(
                        "Receive Cash Out From Merchant",
                        style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() =>
              controller.isCustomerCreate.value==true? GestureDetector(
                onTap: (){
                  Get.to(()=>const CreateCustomerScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
                  width: SizeConfig.screenWidth! * 0.5,
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(width: 0.3))
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/icons/customer-registration.png', height: getProportionateScreenHeight(70), width: getProportionateScreenWidth(70),),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      const Text(
                        "Customer Registration",
                        style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: getProportionateScreenHeight(3)),
                      const  Text(
                        "Customer Registration",
                        style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.w400),
                      ),

                    ],
                  ),
                ),
              ):Container()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() =>  controller.isCustomerCreate.value==true? GestureDetector(
                onTap: (){
                  Get.to(()=>const UpdateCustomerScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
                  width: SizeConfig.screenWidth! * 0.5,
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(width: 0.3), right: BorderSide(width: 0.3))
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/icons/update-cutomer-information.png', height: getProportionateScreenHeight(70), width: getProportionateScreenWidth(70),),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      const Text(
                        "Update Customer",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: getProportionateScreenHeight(3)),
                      const  Text(
                        "Update Customer Account",
                        style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ):Container()),

              GestureDetector(
                onTap: (){
                  Get.to(const BalanceScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
                  width: SizeConfig.screenWidth! * 0.5,
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(width: 0.3))
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/icons/balance-check.png', height: getProportionateScreenHeight(70), width: getProportionateScreenWidth(70),),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      const Text(
                        "BALANCE CHECK",
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
                      Image.asset('assets/icons/transaction.png', height: getProportionateScreenHeight(70), width: getProportionateScreenWidth(70),),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      const Text(
                        "TRANSACTION",
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
              GestureDetector(
                onTap: (){
                  Get.to(const BalanceTransferScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
                  width: SizeConfig.screenWidth! * 0.5,
                  decoration: const BoxDecoration(
                    // border: Border(bottom: BorderSide(width: 0.3))
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/icons/balance_Transfer.png', height: getProportionateScreenHeight(70), width: getProportionateScreenWidth(70),),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      const Text(
                        "Balance Transfer",
                        style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: getProportionateScreenHeight(3)),
                      const  Text(
                        "Transfer Balance To Agent",
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
              Obx(() =>
              controller.walletType.value==112?Container():controller.walletType.value==114?Container() : GestureDetector(
                onTap: (){
                  Get.to(const CreateAgentScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
                  width: SizeConfig.screenWidth! * 0.5,
                  decoration: const BoxDecoration(
                      border: Border( right: BorderSide(width: 0.3), top: BorderSide(width: 0.3))
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/icons/Create Agent.png', height: getProportionateScreenHeight(70), width: getProportionateScreenWidth(70),),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      const Text(
                        "Create Agent",
                        style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: getProportionateScreenHeight(3)),
                      const  Text(
                        "Create Agent",
                        style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              )),
              controller.walletType.value==112?Container():controller.walletType.value==114?Container(): GestureDetector(
                onTap: (){
                  Get.to(const DistributorCashOutScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
                  width: SizeConfig.screenWidth! * 0.5,
                  decoration: const BoxDecoration(
                      border: Border(top: BorderSide(width: 0.3))
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/icons/Distributor_cash_out.png', height: getProportionateScreenHeight(70), width: getProportionateScreenWidth(70),),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      const Text(
                        "Distributor Cash Out",
                        style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: getProportionateScreenHeight(3)),
                      const  Text(
                        "Cash Out To Master Wallet",
                        style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: getProportionateScreenHeight(20),)

                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20),)
          //       GestureDetector(
          //       onTap: (){
          //         Get.to(const CashInScreen());
          //       },
          //       child:Container(
          //         padding: const EdgeInsets.all(15),
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           border: Border.all(color: stroke),
          //           borderRadius: const BorderRadius.all(Radius.circular(5))
          //
          //         ),
          //         child: Row(
          //           children: [
          //             SvgPicture.asset(
          //               "assets/icons/cash-In.svg",
          //               color: kColorPrimary,
          //               height: 30,
          //               width: 30,
          //             ),
          //             const SizedBox(width: 30,),
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: const [
          //                 Text("Cash In",style: TextStyle(color: Colors.black,fontSize: 18),),
          //                 Text("Sent Money To Customer",style: TextStyle(color: Colors.black,fontSize: 13),),
          //               ],
          //             )
          //           ],
          //         ),
          //       ),
          //       ),
          //       SizedBox(height: getProportionateScreenHeight(30),),
          //       GestureDetector(
          //         onTap: (){
          //
          //         },
          //         child:Container(
          //           padding: const EdgeInsets.all(15),
          //           decoration: BoxDecoration(
          //               color: Colors.white,
          //               border: Border.all(color: stroke),
          //               borderRadius: const BorderRadius.all(Radius.circular(5))
          //
          //           ),
          //           child: Row(
          //             children: [
          //               SvgPicture.asset(
          //                 "assets/icons/money-withdraw.svg",
          //                 color: kColorPrimary,
          //                 height: 30,
          //                 width: 30,
          //               ),
          //               const SizedBox(width: 30,),
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: const [
          //                   Text("Non Member Cash Out",style: TextStyle(color: Colors.black,fontSize: 18),),
          //                   Text("Cash Out Using Security Code",style: TextStyle(color: Colors.black,fontSize: 13),),
          //                 ],
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //       SizedBox(height: getProportionateScreenHeight(30),),
          //       GestureDetector(
          //         onTap: (){
          //           Get.to(const AgentMerchantCashOutScreen());
          //         },
          //         child:Container(
          //           padding: const EdgeInsets.all(15),
          //           decoration: BoxDecoration(
          //               color: Colors.white,
          //               border: Border.all(color: stroke),
          //               borderRadius: const BorderRadius.all(Radius.circular(5))
          //
          //           ),
          //           child: Row(
          //             children: [
          //               SvgPicture.asset(
          //                 "assets/icons/money-withdraw-member.svg",
          //                 color: kColorPrimary,
          //                 height: 30,
          //                 width: 30,
          //               ),
          //               const SizedBox(width: 30,),
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: const [
          //                   Text("Merchant Cash Out",style: TextStyle(color: Colors.black,fontSize: 18),),
          //                   Text("Receive Cash Out From Merchant",style: TextStyle(color: Colors.black,fontSize: 13),),
          //                 ],
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //       SizedBox(height: getProportionateScreenHeight(30),),
          // Obx(() =>
          //      controller.isCustomerCreate.value==true?GestureDetector(
          //         onTap: (){
          //           Get.to(()=>const CreateCustomerScreen());
          //         },
          //         child:Container(
          //           padding: const EdgeInsets.all(15),
          //           decoration: BoxDecoration(
          //               color: Colors.white,
          //               border: Border.all(color: stroke),
          //               borderRadius: const BorderRadius.all(Radius.circular(5))
          //
          //           ),
          //           child: Row(
          //             children: [
          //               SvgPicture.asset(
          //                 "assets/icons/User.svg",
          //                 color: kColorPrimary,
          //                 height: 30,
          //                 width: 30,
          //               ),
          //               const SizedBox(width: 30,),
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: const [
          //                   Text("Customer Registration",style: TextStyle(color: Colors.black,fontSize: 18),),
          //                   Text("Customer Registration",style: TextStyle(color: Colors.black,fontSize: 13),),
          //                 ],
          //               )
          //             ],
          //           ),
          //         ),
          //       ):Container(),),
          //      SizedBox(height: getProportionateScreenHeight(30),),
          // Obx(() =>
          //       controller.isCustomerCreate.value==true? GestureDetector(
          //         onTap: (){
          //           Get.to(()=>const UpdateCustomerScreen());
          //         },
          //         child:Container(
          //           padding: const EdgeInsets.all(15),
          //           decoration: BoxDecoration(
          //               color: Colors.white,
          //               border: Border.all(color: stroke),
          //               borderRadius: const BorderRadius.all(Radius.circular(5))
          //
          //           ),
          //           child: Row(
          //             children: [
          //               const Icon(
          //                 Icons.update,
          //                 color: kColorPrimary,
          //                 size: 30,
          //               ),
          //               const SizedBox(width: 30,),
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children:  [
          //                   SizedBox(
          //                     width: getProportionateScreenWidth(200),
          //                     child: const Text("Update Customer Information",style: TextStyle(color: Colors.black,fontSize: 18),),
          //                   ),
          //                   const Text("Update Customer Account",style: TextStyle(color: Colors.black,fontSize: 13),),
          //                 ],
          //               )
          //             ],
          //           ),
          //         ),
          //       ):Container(),)
        ],
      ),
    );
  }

}