import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/get-payment/controller/get_payment_controller.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'component/amount_field.dart';
import 'component/reference_field.dart';

class GetPaymentScreen extends GetView<GetPaymentController>{
  const GetPaymentScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Get.lazyPut<GetPaymentController>(
          () => GetPaymentController(),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        title: const Text("Merchant Payment"),
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          width: SizeConfig.screenWidth,
          child: Form(
              key: controller.getPaymentFromKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),

                  const AmountFormField(),

                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  const BuildReferenceFormField(),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (){
                          controller.referenceController.text="";
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
                          controller.checkPayment(context);
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
                          child: const Center(child: Center(child:Text("Pay",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
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