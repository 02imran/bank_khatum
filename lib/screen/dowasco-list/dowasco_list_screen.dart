import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../constants.dart';
import '../../global.dart';
import '../../model/hive/dowasco_account_model.dart';
import '../../size_config.dart';
import '../add-dowasco/add_dowasco-screen.dart';
import '../dowasco-accountdetails/success/controller/dowasco_details_controller.dart';
import '../dowasco-accountdetails/success/dowasco_overview_screen.dart';
import '../merchant-payment-dowasco_other/merchant_payment_dowasco_other.dart';
import '../merchant-payment/merchant_payment.dart';
import 'controller/dowasco_list_controller.dart';

class DowascoListScreen extends GetView<DowascoListScreenController> {
  const DowascoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<DowascoListScreenController>(
      () => DowascoListScreenController(),
    );
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const AddDowascoScreen());
        },
        backgroundColor: kColorPrimaryNew,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Dowasco"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [

            Container(
              margin: const EdgeInsets.only(left: 18,right: 18,top: 12),
              child: GestureDetector(
                onTap: (){
                  Get.to(const MerchantPaymentDowascoOtherScreen(),arguments: [dowascoMerchantName,dowascoMerchantCode,""]);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(10)
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            child: ClipRRect(
                              child: Image.asset("assets/images/ico_dowasco.jpeg"),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          const Text("Other Payment",style: TextStyle(fontSize: 16,color: Colors.black),),
                        ],
                      ),
                      const Icon(Icons.arrow_forward)
                    ],
                  ),
                ),
              ),
            ),

            Obx(() =>
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.listModel.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: Key(controller.listModel[index].accountNumber.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) async {
                      final box = await Hive.openBox<DowascoAccountModel>('dowascoAccount');
                      box.deleteAt(index);
                      controller.listModel.removeAt(index);
                    },
                    background: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const Spacer(),
                          SvgPicture.asset("assets/icons/Trash.svg"),
                        ],
                      ),
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Get.to(const DowascoOverviewScreen(),arguments: [controller.listModel[index].accountNumber]);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30.0,
                                  child: ClipRRect(
                                    child: Image.asset("assets/images/ico_dowasco.jpeg"),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Text(controller.listModel[index].accountNumber,style: const TextStyle(fontSize: 16,color: Colors.black),),
                              ],
                            ),
                            Text("("+controller.listModel[index].tittle+")",style: const TextStyle(fontSize: 16,color: Colors.black),),
                          ],
                        ),
                      ),
                    )
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
