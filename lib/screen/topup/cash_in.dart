import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:wallet_merchant/EnCryptHelper.dart';
import 'package:wallet_merchant/constants.dart';
import '../../size_config.dart';
import 'component/amount_field.dart';
import 'component/phone_code_field.dart';
import 'component/qr_view.dart';
import 'controller/cash_in_controller.dart';

class CashInScreen extends GetView<CashInController>{

  CashInScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.lazyPut<CashInController>(
          () => CashInController(),
    );
    return Scaffold(

      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        title: const Text("Top Up",style: TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(()=>const QRViewExample());
          // _scan();
        },
        backgroundColor: kColorPrimaryNew,
        child: const Icon(Icons.qr_code,color: Colors.white,),
      ),

      body: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          width: SizeConfig.screenWidth,
          child: Form(
              key: controller.cashInFromKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  const BuildPhoneCodeFormField(),
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
                          controller.phoneController.text="";
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
                          controller.checkCashIn(context);
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

  Future<void> _scan() async {
    String barcodeScan = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", false, ScanMode.DEFAULT);
    print("Log From Qr Code Scanner::"+barcodeScan);
    var output=EnCryptHelper.extractPayload(barcodeScan);
    print("Log After Decode::"+output);

    var data=output.split(",");
    // co
    if(data[0]=="Receive"){
      controller.phoneController.text=data[2].substring(3, 11);
    }
  }

}


