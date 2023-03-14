import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/size_config.dart';

import '../../constants.dart';
import 'components/build_subid_form_field.dart';
import 'components/single_pakage_purchase.dart';
import 'controller/pakage_purchage_controller.dart';

class PakagePurchageScreen extends GetView<PakagePurchageController> {
  const PakagePurchageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<PakagePurchageController>(
            () => PakagePurchageController(),
        fenix: true
    );
    controller.subIdControllerSignIn.text = '';
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        title: const Text("Package Purchase",style: TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20),),
              const BuildSubIdFormField(),
              SizedBox(height: getProportionateScreenHeight(40),),
              InkWell(
                onTap: () {
                  if(controller.subIdControllerSignIn.text.isNotEmpty){
                    controller.getMembershipId();
                    controller.getAkashPakageList();
                  }else{
                    Fluttertoast.showToast(
                        msg: 'Enter Sub Id First',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM);
                  }

                },
                child: Container(
                  width: getProportionateScreenHeight(190),
                  height: getProportionateScreenHeight(50),
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                      boxShadow:  [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: Offset(1, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue),
                  child:  Center(
                    child: Center(
                      child: Text(
                        'search Package'.toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(40),),

             Obx(() => controller.pakageList.isNotEmpty?  Container(
               padding: EdgeInsets.all(15),
               height: getProportionateScreenHeight(170),
               width: SizeConfig.screenWidth,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(3),
                   color: Colors.white
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const Text('Package', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),),
                   SizedBox(height: getProportionateScreenHeight(15),),
                   SizedBox(
                     height: getProportionateScreenHeight(90),
                     child: ListView.builder(
                         itemCount: controller.pakageList.length,
                         shrinkWrap: true,
                         scrollDirection: Axis.horizontal,
                         itemBuilder: (context, index)=>GestureDetector(
                           onTap: (){
                               Get.to(()=> SinglePakagePurchage(
                                 id: controller.pakageList.value[index].id,
                                 price: controller.pakageList.value[index].price,
                                 icon: controller.pakageList.value[index].icon,
                               ), );


                           },
                           child: Card(
                             elevation: 2,
                             child: Container(
                               // decoration: BoxDecoration(
                               //   color: Colors.white,
                               //    boxShadow: [
                               //      BoxShadow(
                               //        offset: Offset(1, 5),
                               //        color: Colors.grey.shade200.withOpacity(0.2),
                               //        blurRadius: 1,
                               //        spreadRadius: 4
                               //      ),
                               //      BoxShadow(
                               //          offset: Offset(5,1),
                               //          color: Colors.grey.shade200.withOpacity(0.2),
                               //          blurRadius: 1,
                               //          spreadRadius: 4
                               //      )
                               //    ]
                               // ),

                               padding: EdgeInsets.all(5),
                               margin: EdgeInsets.only(right: 20, left: 5, bottom: 5, top: 5),
                               child: ClipRRect(
                                 borderRadius: BorderRadius.circular(10),
                                 child: Image.network('${controller.pakageList.value[index].icon}', height: getProportionateScreenHeight(70),
                                   width: getProportionateScreenWidth(150),
                                   fit: BoxFit.fill,
                                 ),
                               ),
                             ),
                           ),
                         )),
                   )
                 ],
               ),
             ):Container())
            ],
          ),
        ),
      ),
    );
  }
}
