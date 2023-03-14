import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wallet_merchant/screen/dashboard/dashboard.dart';
import 'package:wallet_merchant/screen/success/controller/success_controller.dart';
import 'package:wallet_merchant/size_config.dart';

import '../../constants.dart';
import '../dashboard/controller/dashboard_controller.dart';

class SuccessScreen extends GetView<SuccessController>{
   SuccessScreen({Key? key}) : super(key: key);

  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<SuccessController>(
          () => SuccessController(),
    );

    var keyword=Get.arguments[1];
    var msidn=Get.arguments[4];
    var customerAccount = Get.arguments[3];
    var fromAccount = Get.arguments[5];

    return WillPopScope(
     onWillPop: () async => false,
     child: Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kColorPrimaryNew,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        title: const Text("Success"),
      ),
      body: Container(
        width: SizeConfig.screenWidth,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(30),),
            Obx(()=>
                controller.statusCode.value==0?Image.asset("assets/images/ico_transaction_successful.png",height: getProportionateScreenHeight(60),width: getProportionateScreenWidth(60),):
                controller.statusCode.value==1 ?Image.asset("assets/images/ico_transaction_failed.png",height: getProportionateScreenHeight(60),width: getProportionateScreenWidth(60),):
                controller.statusCode.value==3?Image.asset("assets/images/ico_transaction_failed.png",height: getProportionateScreenHeight(60),width: getProportionateScreenWidth(60),):
                controller.statusCode.value==2?Image.asset("assets/images/ico_transaction_in_progress.png",height: getProportionateScreenHeight(60),width: getProportionateScreenWidth(60),):
                controller.statusCode.value==4?Image.asset("assets/images/ico_transaction_in_progress.png",height: getProportionateScreenHeight(60),width: getProportionateScreenWidth(60),):
                controller.statusCode.value==5?Image.asset("assets/images/ico_transaction_in_progress.png",height: getProportionateScreenHeight(60),width: getProportionateScreenWidth(60),):
                controller.statusCode.value==6?Image.asset("assets/images/ico_transaction_in_progress.png",height: getProportionateScreenHeight(60),width: getProportionateScreenWidth(60),):
                Container()
             ),
            SizedBox(height: getProportionateScreenHeight(13),),
           Obx(()=>
               Text(controller.statusMessage.value,style: const TextStyle(color: Colors.black,fontSize: 18),),

            ),
            SizedBox(height: getProportionateScreenHeight(13),),
            Obx(()=>
                Text(getDescription(keyword,controller.statusCode.value),style: const TextStyle(fontSize: 13),textAlign: TextAlign.center,),
            ),
            SizedBox(height: getProportionateScreenHeight(20),),
            Container(
              padding: const EdgeInsets.only(left:30,right: 30,top: 10,bottom: 10),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                color: stroke,
                border: Border.all(color: Colors.grey,)
              ),

              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("From Account"),


                      keyword == 'CASH'? Text("+"+fromAccount, style: const TextStyle(color: Colors.black),) :keyword == 'MGIV'? Obx(() => Text("+"+'${controller.fromAccount.value==""?fromAccount:controller.fromAccount.value}', style: const TextStyle(color: Colors.black),)) :dashboardController.userType.value =="Agent"?  Text("+"+ '${msidn == ''? controller.fromAccount.value: msidn}',style: const TextStyle(color: Colors.black),textAlign: TextAlign.end):
                       Text("+"+'${customerAccount=='' ?fromAccount:customerAccount}',style: const TextStyle(color: Colors.black),textAlign: TextAlign.end),

                    ],
                  ),
                  const SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("To Account"),

                        Obx(() => Text("+"+controller.toAccount.value,style: const TextStyle(color: Colors.black),textAlign: TextAlign.end),)

                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      keyword == 'MGIV'? const Text("Cash Out Amount") :const Text("Top Up Amount"),
                      Obx(()=>
                          Text(controller.amount.value +" XCD",style: const TextStyle(color: Colors.black),),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  keyword == 'CASH'?const SizedBox(): dashboardController.userType.value =="Agent"?   Column(
                    children: [
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          const Text("Commission Earned"),
                          Obx(()=>
                          controller.commissionEarned.value.isNotEmpty?   Text(NumberFormat("#,###").format(int.parse(controller.commissionEarned.value)) + ' XCD',style: const TextStyle(color: Colors.black),):const SizedBox(),
                          )

                        ],
                      ),
                    ],
                  ): Container(),
                  dashboardController.userType.value =="Agent"? Column(
                    children: [
                      const SizedBox(height: 10,),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          const Text("Fee Charge"),
                          Obx(()=>
                              Text(controller.feeCharge.value + " XCD",style: const TextStyle(color: Colors.black),),
                          )

                        ],
                      ),
                    ],
                  ): keyword == 'MGIV'? Column(
                    children: [
                      const SizedBox(height: 10,),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          const Text("Fee Charge"),
                          Obx(()=>
                              Text(controller.feeCharge.value + " XCD",style: const TextStyle(color: Colors.black),),
                          )

                        ],
                      ),
                    ],
                  ): Container(),
                  const SizedBox(height: 10,),
                  //
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("Total Amount"),
                      Obx(()=>
                          Text(controller.totalAmount.value + " XCD",style: const TextStyle(color: Colors.black),)

                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("Transaction Date"),
                       Obx(()=>
                       controller.transactionDate.value.isNotEmpty ?  Text(DateFormat('yyyy-MM-dd hh:mm').format(
                         DateTime.parse(controller.transactionDate.value)),style: const TextStyle(color: Colors.black),): SizedBox(),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("Transaction ID"),
                      Obx(()=>
                       Text(controller.transactionIdv.value,style: const TextStyle(color: Colors.black),),
                      )
                    ],
                  ),

                ],
              ),

            ),
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


          ],
        ),
      ),
    ));

  }

  String getDescription(String keyword,int statusCode){

    if(keyword=="MGIV"){
      return getCashOutMessage(statusCode);
    }


      return "";
  }

  String getCashOutMessage(int statusCode){

    if(statusCode==0){
      return "Your Cash Out has been performed\nsuccessfully.";
    }else if(statusCode==1 || statusCode==3){
      return "Your Cash Out has failed.";
    }else if(statusCode==2){

    }else if(statusCode==4 || statusCode==5){
      return "Your Cash Out has failed.";
    }else if(statusCode==6){
      return "Your Cash Out has failed.";
    }

    return "";

  }

}