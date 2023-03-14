import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../size_config.dart';
import '../merchant-payment/merchant_payment.dart';
import 'controller/dynamic_merchant_list_controller.dart';
import '../../../model/response/merchant-list-response/MerchantListResponse.dart';

class DynamicMerchantListScreen extends GetView<DynamicMerchantListController>{
  const DynamicMerchantListScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.lazyPut<DynamicMerchantListController>(
          () => DynamicMerchantListController(),
    );
    var itemId=Get.arguments[0];
    return Scaffold(

      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        title: const Text("Merchant List"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Obx(() =>
               controller.myMerchantListResponseData.value.payload !=null?Container(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight,
                  color: stroke,

                  child: controller.myMerchantListResponseData.value.payload!.isNotEmpty?buildList(controller.myMerchantListResponseData.value.payload):SizedBox(
                    height: SizeConfig.screenHeight,
                    width: SizeConfig.screenWidth,
                    child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Trash.svg",
                            height: getProportionateScreenHeight(30),
                            width: getProportionateScreenWidth(30),
                            color: kColorPrimary,
                          ),
                          const SizedBox(height: 15,),
                          const Text("No Merchant Found",style: TextStyle(fontSize: 16),)
                        ],

                    ),
                  )
                ):Container()
            )

          ],
        ),
      ),



    );
  }

  Widget buildList( List<Payload>? payload) {
    return  SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          ...List.generate(payload!.length, (index) {
            return Container(
              margin: const EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: (){

                  Get.to(const MerchantPaymentScreen(),arguments: [payload[index].merchent!.merchantName!,payload[index].mercCode,"",""]);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(10)
                  ),

                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        child: ClipRRect(
                          child: Image.network(payload[index].merchent!.logoImage!),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      const SizedBox(width: 15,),
                      Text(payload[index].merchent!.merchantName!,style: const TextStyle(fontSize: 16,color: Colors.black),)
                    ],
                  ),
                ),
              )
            );
          }),
        ],

      ),
    );
  }

}