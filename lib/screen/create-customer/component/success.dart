import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/dashboard/dashboard.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var message = Get.arguments[0];


    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kColorPrimaryNew,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text("Status"),
        ),
        body: Container(
          width: SizeConfig.screenWidth,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
            // SizedBox(
            //   height: getProportionateScreenHeight(60),
            //
            // ),

            Image.asset("assets/icons/Transaction-user.png",
              height: getProportionateScreenHeight(240),
              width: getProportionateScreenWidth(200),
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: getProportionateScreenHeight(10)),

            // Text(message,style: const TextStyle(fontSize: 13),textAlign: TextAlign.center,),

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
