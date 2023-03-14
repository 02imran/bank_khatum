
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/constants.dart';
import 'package:wallet_merchant/screen/redeem_points/components/success_screen.dart';

import '../../../size_config.dart';
import '../controller/redeem_points_controller.dart';

class ReedemPointsDetails extends GetView<RedeemPointsController> {
  const ReedemPointsDetails({required this.id, Key? key}) : super(key: key);

  final String? id;

  @override
  Widget build(BuildContext context) {
        Get.lazyPut<RedeemPointsController>(
      () => RedeemPointsController(),
      fenix: true
    );
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FA),
      appBar: AppBar(title: Text('Redeem Points'),
        backgroundColor: kColorPrimaryNew,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network('${controller.voucherImage.value}',
              height: getProportionateScreenHeight(160),
              width: SizeConfig.screenWidth,fit: BoxFit.fill,),
            ),
            SizedBox(height: getProportionateScreenHeight(40)),


            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              // height: getProportionateScreenHeight(125),
              width: SizeConfig.screenWidth,
            decoration: const BoxDecoration(
              color: Colors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children:  [
                    const Text('Member ID           :     ', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,color: Color(0xFF535252)),),
                    const Spacer(),
                    Text('${controller.merchantId.value}', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,color: Color(0xFF535252)),),
                    const Spacer(flex: 9,)
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Row(
                  children:  [
                    const Text('Amount                :  ', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,color: Color(0xFF535252)),),
                    const Spacer(),
                    Text('${controller.amount.value}', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,color: Color(0xFF535252)),),
                    const Spacer(flex: 9,)
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Row(
                  children:  [
                    const Text('Points Required   :   ', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,color: Color(0xFF535252)),),
                    const Spacer(),
                    Text('${controller.rewardPoint.value}', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,color: Color(0xFF535252)),),
                    const Spacer(flex: 10,)
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Row(
                  children:  [
                    const Text('Merchant Name  :', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,color: Color(0xFF535252)),),
                    const Spacer(),
                    Text('${controller.merchantName.value}', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,color: Color(0xFF535252)),),
                    const Spacer(flex: 5,)
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Row(
                  children:  [
                   const Text('Expiry Date          :    ', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,color: Color(0xFF535252)),),
                    const Spacer(),
                    Text('${controller.expirDate.value}', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400,color: Color(0xFF535252)),),
                    const Spacer(flex: 9,)
                  ],
                ),

              ],
            ),
            ),
            SizedBox(height: getProportionateScreenHeight(120),),
            GestureDetector(
              onTap: (){
                controller.getMembershipId(id);

              },
              child: Container(
                width: getProportionateScreenWidth(140),
                height: getProportionateScreenHeight(50),
                margin: const EdgeInsets.only(left: 5,right: 5),
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kButtonColor
                ),
                child: const Center(child: Center(child:Text("Confirm",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
              ),
            )
          ],
        ),
      ),
    );
  }
}