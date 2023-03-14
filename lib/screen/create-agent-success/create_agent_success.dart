import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/dashboard/dashboard.dart';

import '../../constants.dart';
import '../../size_config.dart';

class CreateAgentSuccess extends StatelessWidget {
  const CreateAgentSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var agentName = Get.arguments[0];
    var agentNumber = Get.arguments[1];

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kColorPrimaryNew,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text("Success"),
        ),
        body: Container(
          width: SizeConfig.screenWidth,
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            SizedBox(
              height: getProportionateScreenHeight(30),

            ),

            Image.asset("assets/images/ico_transaction_successful.png",height: getProportionateScreenHeight(60),width: getProportionateScreenWidth(60),),
            SizedBox(
              height: getProportionateScreenHeight(10),

            ),
            const Text("Success",style: TextStyle(color: Colors.black,fontSize: 18),),
            SizedBox(
              height: getProportionateScreenHeight(10),

            ),
            const Text("Your request has been performed\nsuccessfully.",style: TextStyle(fontSize: 13),textAlign: TextAlign.center,),

            SizedBox(
              height: getProportionateScreenHeight(15),

            ),
             Text("Agent Name:"+agentName,style: const TextStyle(fontSize: 13),textAlign: TextAlign.center,),
            SizedBox(
              height: getProportionateScreenHeight(6),

            ),
             Text("Agent Number: "+mobilePrefix+agentNumber,style: const TextStyle(fontSize: 13),textAlign: TextAlign.center,),

            SizedBox(height: getProportionateScreenHeight(20),),
            GestureDetector(
              onTap: (){
                Get.offAll(const Dashboard());
              },
              child: Container(
                width: getProportionateScreenWidth(130),
                padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                decoration: BoxDecoration(
                  color: buttonBackground,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Center(
                  child: Text("Done",style: TextStyle(color: Colors.white),),
                ),
              ),
            )
          ]),
        ));
  }
}
