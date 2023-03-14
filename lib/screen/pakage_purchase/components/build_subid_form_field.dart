

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/pakage_purchase/components/qr_view.dart';


import '../../../constants.dart';
import '../../../size_config.dart';
import '../controller/pakage_purchage_controller.dart';

class BuildSubIdFormField extends GetView<PakagePurchageController> {
  const BuildSubIdFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.subIdControllerSignIn,
      style: const TextStyle(color: kTextColor, fontSize: 17),
      autofocus: false,
      keyboardType: TextInputType.number,
      maxLength: 8,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(8),
      ],
      onSaved: (value) {
        controller.subId = value!;
      },
      // validator: (value) {
      //   return controller.validateSubId(value!);
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
    );
  }


}
