import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/constants.dart';

import '../../size_config.dart';
import 'component/amount_field.dart';
import 'component/name_field.dart';
import 'controller/distributor_cash_out_controller.dart';

class DistributorCashOutScreen extends GetView<DistributorCashOutController>{

  const DistributorCashOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<DistributorCashOutController>(
          () => DistributorCashOutController(),
    );
    return Scaffold(

      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        title: const Text("Distributor CashOut",style: TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),


      body: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          width: SizeConfig.screenWidth,
          child: Form(
              key: controller.balanceTransferFromKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  const BuildNameFormField(),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  const AmountFormField(),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (){
                          controller.amountController.text="";
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
                          controller.checkDistributorCashOut(context);
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

    );
  }





}