import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/constants.dart';

import '../../size_config.dart';
import 'component/curent_pin_field.dart';
import 'component/new_pin_field.dart';
import 'component/reenter_pin_field.dart';
import 'controller/update_pin_controller.dart';

class UpdatePin extends GetView<UpdatePinController>{

  final bool isOpenFromMenu;

  const UpdatePin( {Key? key,required this.isOpenFromMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<UpdatePinController>(
          () => UpdatePinController(),
    );
    return Scaffold(

      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        title: const Text("Change PIN",style: TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            width: SizeConfig.screenWidth,
            child: Form(
                key: controller.setPinFromKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    const BuildCurentPinFormField(),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        const Text("Same 4 digit pin not recommended",style: TextStyle(color:kColorPrimary),),

                      ],
                    ),

                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    const BuildNewPinFormField(),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    const BuildReEnterPinFormField(),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (){
                            controller.newPinController.text="";
                            controller.reEnterPinController.text="";
                          },
                          child: Container(
                            width: getProportionateScreenWidth(140),
                            height: getProportionateScreenHeight(50),
                            margin: const EdgeInsets.only(left: 5,right: 5),
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: colorOrange
                            ),
                            child: const Center(child: Center(child:Text("Clear",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            controller.updatePin(isOpenFromMenu);
                            FocusScope.of(context).requestFocus(FocusNode());
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
                    )

                  ],
                ))

        ),
      ),

    );
  }





}