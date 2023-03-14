
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../size_config.dart';
import '../pakage_purchase/controller/pakage_purchage_controller.dart';
import 'components/build_membershipid_form_field.dart';
import 'components/reedem_points_details.dart';
import 'controller/redeem_points_controller.dart';
import 'models/response/MyRedeemVoucherListResponseModel.dart';

class RedeemPointsScreen extends GetView<RedeemPointsController> {
  const RedeemPointsScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Get.put(PakagePurchageController());
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FA),
      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        title: const Text("Redeem Points",style: TextStyle(color: Colors.white),),
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(20),),
              const BuildMembershipIdFormField(),
              SizedBox(height: getProportionateScreenHeight(20),),

               
              SizedBox(height: getProportionateScreenHeight(15),),
              Obx(()=>Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey)
                ),
                child: DropdownButton<String>(
                  iconDisabledColor: Colors.grey,
                  iconEnabledColor: Colors.grey,
                  value: controller.dropdownValue.value,
                  style: TextStyle(color: Colors.grey),
                  isExpanded: true,
                  isDense: true,
                  // hint: Text('Select Voucher Type'),

                  icon: const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey,),
                  elevation: 16,
                  // style: const TextStyle(color: Colors.white),
                  underline: Container(),
                  onChanged: (String? newValue) {
                    controller.membershipIdController.text.isNotEmpty?
                    controller.dropdownValue.value = newValue!
                        :controller.dropdownValue.value
                    ;
                  },
                  items: <String>['Select Voucher','Cash', 'Product', 'Discount']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              ),
              SizedBox(height: getProportionateScreenHeight(20),),
              controller.dropdownValue.value == 'Select Voucher' ?const SizedBox(): Obx(() => Text(controller.dropdownValue.value, style: const TextStyle(color: Color(0xFF535252), fontWeight: FontWeight.w400, fontSize: 13),),
              ),
              SizedBox(height: getProportionateScreenHeight(20),),
              Obx(() =>               controller.dropdownValue.value == "Cash" ?
              VoucherList(data: controller.cashList,): controller.dropdownValue.value == "Product" ?
              VoucherList(data: controller.productList,):controller.dropdownValue.value == "Discount" ?
              VoucherList(data: controller.discountList,):VoucherList(data: <MyRedeemVoucherInfo>[].obs))

            ],
          ),
        ),
      ),
    );
  }
}


class VoucherList extends GetView<RedeemPointsController> {
   VoucherList({required this.data, Key? key}) : super(key: key);

  final RxList<MyRedeemVoucherInfo>? data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: getProportionateScreenHeight(120),
      // width: SizeConfig.screenWidth,
      child: GridView.builder(
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 0,
            childAspectRatio: 1.3
        ),
        itemCount: data!.length,
        // scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) => GestureDetector(
          onTap: (){
            controller.getVoucherDetails(data![index].id!);
          },
          child: Column(
            children: [
              Container(

                // margin: const EdgeInsets.only(bottom: 20),
                // height: getProportionateScreenHeight(120),
                // width: getProportionateScreenWidth(225),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(5), topLeft: Radius.circular(5)),
                      child: Image.network('${data![index].voucherImage}',
                        fit: BoxFit.fill,
                        width: getProportionateScreenWidth(232),
                        height: getProportionateScreenHeight(82),),
                    ),
                    SizedBox(height: getProportionateScreenHeight(4),),
                    const Center(child: Text('View Details', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Color(0xFFFC6A03)),)),
                    SizedBox(height: getProportionateScreenHeight(4),),
                  ],
                ),
              ),
            ],
          ),
        ), ),
    );
  }
}
