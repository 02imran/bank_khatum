import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/helper/DecimalTextInputFormatter.dart';
import 'package:wallet_merchant/screen/balance-transfer/controller/balance_transfer_controller.dart';
import 'package:wallet_merchant/screen/distributor-cashout/controller/distributor_cash_out_controller.dart';


import '../../../constants.dart';

class AmountFormField extends GetView<DistributorCashOutController>{

  const AmountFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.amountController,
      inputFormatters: [DecimalTextInputFormatter(decimalRange: 1)],
      style: const TextStyle(color: kTextColor,fontSize: 17),
      autofocus: false,
      keyboardType: const TextInputType.numberWithOptions(signed: false,decimal: true),
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