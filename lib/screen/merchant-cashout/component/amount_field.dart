import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/screen/merchant-cashout/controller/merchant_cashout_controller.dart';
import '../../../constants.dart';
import '../../../helper/NumericTextFormatter.dart';
import "package:flutter/services.dart";


class AmountFormField extends GetView<MerchantCashOutController>{

  const AmountFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.amountController,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly,NumericTextFormatter()],
      style: const TextStyle(color: kTextColor,fontSize: 17),
      autofocus: false,
      keyboardType: const TextInputType.numberWithOptions(signed: false,decimal: false),
      maxLength: 15,
      onSaved: (value) {
        controller.amount = value!;
      },
      validator: (value) {
        return controller.validateAmount(value!);
      },
      decoration: const InputDecoration(
        counterText: "",
        labelText: "Enter Amount",
        labelStyle: TextStyle(color: kTextColor),
        contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 0),
        suffixText: "XCD",
        enabledBorder: UnderlineInputBorder(),
        border: UnderlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid,color: kColorPrimary)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid,color: kColorPrimary)),
        errorBorder: UnderlineInputBorder(borderSide: BorderSide(
          color: Colors.red,
        ),),
        focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(
          color: Colors.red,
        ),),



      ),
    );
  }

}