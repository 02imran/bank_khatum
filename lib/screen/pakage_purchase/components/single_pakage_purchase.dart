import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:wallet_merchant/screen/pakage_purchase/components/success_screen.dart';
import 'package:wallet_merchant/size_config.dart';

import '../../../constants.dart';
import '../../../main.dart';
import '../controller/pakage_purchage_controller.dart';



class SinglePakagePurchage extends GetView<PakagePurchageController> {
  const SinglePakagePurchage({this.price, this.icon, required this.id, Key? key}) : super(key: key);

  final int? id;
  final String? price;
  final String? icon;


  @override
  Widget build(BuildContext context) {
    Get.lazyPut<PakagePurchageController>(
            () => PakagePurchageController(),
        fenix: true
    );

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20),),
            Container(

              padding: const EdgeInsets.all(15),
              height: getProportionateScreenHeight(150),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(3),
                  color: Colors.white
              ),
              child: Column(

                children: [
                  const Text('Package', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),),
                  SizedBox(height: getProportionateScreenHeight(15),),
                  Card(
                    elevation: 3,
                    child: Container(
                      padding: EdgeInsets.all(3),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(4),
                       color: Colors.white,

                     ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network('$icon', height: getProportionateScreenHeight(70),
                          width: getProportionateScreenWidth(150),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20),),
            Container(
              padding: const EdgeInsets.all(10),
              height: getProportionateScreenHeight(270),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,

                  borderRadius: BorderRadius.circular(4)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: getProportionateScreenHeight(10),),
                  Text('Sub ID   ${controller.subIdControllerSignIn.text}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
                  // Text('Name     Mr. Hashan Ali', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),

                  Divider(),
                  SizedBox(height: getProportionateScreenHeight(25),),
                  Center(
                    child: SizedBox(
                      width: getProportionateScreenWidth(180),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Container(
                              height: getProportionateScreenHeight(45),
                              width: getProportionateScreenWidth(150),
                              decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/amount_field.png'), fit: BoxFit.fill)
                              ),
                              child: Center(child: Text('৳$price', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),)),
                            )

                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: getProportionateScreenHeight(25),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Builder(
                      builder: (context) {
                        final GlobalKey<SlideActionState> _key =
                        GlobalKey();
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SlideAction(
                            key: _key,
                            height: 55,
                            sliderButtonIconPadding: 14,
                            innerColor: kColorPrimary,
                            outerColor: Colors.white,
                            sliderButtonIcon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 14,
                            ),
                            sliderButtonIconSize: 8,
                            textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: kColorPrimary,
                            ),
                            text: 'Slide to Purchase'.toUpperCase(),
                            onSubmit: () {
                              controller.paymentProcess(id, price);
                              _key.currentState!.reset();
                            },
                          ),
                        );
                      },
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
