

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/pakage_purchase/components/qr_view.dart';
import '../../../constants.dart';
import '../controller/redeem_points_controller.dart';

class BuildMembershipIdFormField extends GetView<RedeemPointsController> {
  const BuildMembershipIdFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TextFormField(
        controller: controller.membershipIdController,
        style: const TextStyle(color: Colors.black, fontSize: 17),
        autofocus: false,
        keyboardType: TextInputType.number,
        maxLength: 8,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(8),
        ],
        onSaved: (value) {
          controller.membershipId = value!;
        },
        // validator: (value) {
        //   return controller.validateMemberId(value!);
        // },
        decoration:  InputDecoration(
            counterText: "",
            // labelText: "Sub ID",
            // labelStyle:  TextStyle(
            //   color: kTextColor,
            // ),
          hintText: 'Sub ID',
            hintStyle:const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    style: BorderStyle.solid, color: Colors.grey)),
            border:const  OutlineInputBorder(
                borderSide:
                BorderSide(style: BorderStyle.solid, color: kColorPrimary)),
            focusedBorder: const OutlineInputBorder(
                borderSide:
                BorderSide(style: BorderStyle.solid, color: kColorPrimary)),
            errorBorder:const  OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
          suffixIcon: IconButton(onPressed: (){
            Get.to(()=>const QRViewExample());
          }, icon: const Icon(Icons.qr_code)),
            ),
      ),
    );
  }


}
