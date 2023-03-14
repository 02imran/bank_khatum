import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/model/response/report/ReportResponse.dart';
import 'package:wallet_merchant/screen/refund-overview/refund_overview_screen.dart';
import 'package:wallet_merchant/size_config.dart';

import '../../constants.dart';
import '../../local_auth/local_auth.dart';
import '../dashboard/controller/dashboard_controller.dart';
import 'component/custom_list_body.dart';
import 'controller/transaction_controller.dart';

class TransactionHistoryScreen extends GetView<TransactionController>{
   TransactionHistoryScreen({Key? key}) : super(key: key);

  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<TransactionController>(
          () => TransactionController(),
    );
    return Scaffold(

      appBar: AppBar(
        backgroundColor: kColorPrimary,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        title: const Text("Transaction"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: SizeConfig.screenWidth,
              color: kColorPrimary.withOpacity(0.7),
              child: Container(
                width: SizeConfig.screenWidth,
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "From Date",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white),
                            ),
                            const SizedBox(height: 8,),
                         Obx(() =>
                            GestureDetector(
                                onTap: () => {
                                  _selectStartDate(context)
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(top: 8,bottom: 8,left: 10,right: 60),
                                  decoration: BoxDecoration(
                                     color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/icons/Date_icon.png', height: getProportionateScreenHeight(15), 
                                        width: getProportionateScreenWidth(15),),
                                      const SizedBox(width: 10),
                                      Text(
                                        "${controller.selectedStartDate.value.toLocal()}".split(' ')[0],
                                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold,color: Colors.black),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                           )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "To Date",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white),
                            ),
                            const SizedBox(height: 8,),
                            Obx(() =>
                                GestureDetector(
                                    onTap: () => {
                                      _selectEndDate(context)
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 8,bottom: 8,left: 10,right: 60),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset('assets/icons/Date_icon.png', height: getProportionateScreenHeight(15),
                                            width: getProportionateScreenWidth(15),),
                                          const SizedBox(width: 10),
                                          Text(
                                            "${controller.selectedEndDate.value.toLocal()}".split(' ')[0],
                                            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold,color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    )
                                ),
                            )
                          ],
                        )


                      ],
                    ),
                    const SizedBox(height: 15,),
                    GestureDetector(
                      onTap: ()async{
                        final isAuthenticated = await LocalAuth.authentication();
                        if (isAuthenticated) {
                          controller.getTransactionHistory();
                        }else {
                          final biometrics = await LocalAuth.getBiometrics();
                          if(biometrics.isEmpty){

                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Authentication Required', style: TextStyle(fontSize: 16),),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('Fingerprint not set to your device Go to \'Settings>Security\' to add your fingerprint', style: TextStyle(fontSize: 10),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(onPressed: (){Get.back();}, child:const Text('CANCEL', style: TextStyle(fontSize: 11, color: Colors.green),)),
                                        TextButton(onPressed: (){AppSettings.openSecuritySettings();}, child:const Text('GO TO SETTINGS',style: TextStyle(fontSize: 11, color: Colors.green)))
                                      ],)
                                  ],
                                ),
                              ),
                            );
                          }else{
                            Fluttertoast.showToast(
                                backgroundColor: Colors.red,
                                msg: "Authentication Required",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM);
                          }}


                        // controller.getTransactionHistory();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 38,right: 38),
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xFF663AB3)
                        ),
                        child: const Center(child: Padding(padding: EdgeInsets.all(5),child:Text("Search",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
                      ),
                    )


                  ],
                )
              ),
            ),
        Obx(() =>
            Container(
              padding: const EdgeInsets.only(left: 10,right: 10),
              width: SizeConfig.screenWidth,
              color: stroke,

              child: controller.reportResponseData.value.issuccess!?buildList(context,controller.reportResponseData.value):Container(),
            )
        )

          ],
        ),
      ),



    );
  }


  Widget buildList(BuildContext context,ReportResponse response) {
    return  Column(
        children: [
          ...List.generate(response.payload!.length, (index) {
            return Container(
              margin: const EdgeInsets.only(top: 10),
              child: dashboardController.userType.value=="Merchant" ? GestureDetector(
                  onTap: (){
                    controller.displayDialog(context,response.payload![index].transactionID!);
                  },
                  child: CustomListBody(payload: response.payload![index],)
              ):CustomListBody(payload: response.payload![index],),

            );
          }),
        ],

    );
  }

  _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.selectedStartDate.value, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != controller.selectedStartDate.value){

      controller.selectedStartDate.value=picked;

    }

  }

  _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.selectedEndDate.value, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != controller.selectedEndDate.value) {

      controller.selectedEndDate.value = picked;
    }
  }

}