import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/constants.dart';
import '../../size_config.dart';
import 'component/amount_field.dart';
import 'component/phone_code_field.dart';
import 'controller/flow_controller.dart';

class FlowScreen extends GetView<FlowController>{

  const FlowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<FlowController>(
          () => FlowController(),
    );
    return Scaffold(

      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        title: const Text("MLajan Flow Recharge",style: TextStyle(color: Colors.white),),
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
                key: controller.flowFromKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Image.asset("assets/images/flow_round.png",height: 150,width: 150,),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    const BuildPhoneCodeFormField(),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    const AmountFormField(),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),


                    buildAmountList(["5","10","15","20","25","30","35","40","45","50","55","60","65","70","75","80","85","90","95","100"]),

                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (){
                            controller.phoneController.text="";
                            controller.amountController.text="";
                          },
                          child: Container(
                            width: getProportionateScreenWidth(160),
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
                            controller.checkTopUp(context);
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          child: Container(
                            width: getProportionateScreenWidth(160),
                            height: getProportionateScreenHeight(50),
                            margin: const EdgeInsets.only(left: 5,right: 5),
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: kButtonColor
                            ),
                            child: const Center(child: Center(child:Text("Send",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
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


  Widget buildAmountList( List<String>? payload) {
    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(payload!.length, (index) {
            return Container(
                margin: const EdgeInsets.only(left: 10),
                height: getProportionateScreenHeight(40),
                width: getProportionateScreenWidth(40),
                decoration: BoxDecoration(
                  border: Border.all(color: stroke),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: GestureDetector(
                  onTap: (){
                    controller.amountController.text=payload[index];
                  },
                  child: Center(
                    child: Text(payload[index]),
                  )
                )
            );
          }),
        ],

      ),
    );
  }







}