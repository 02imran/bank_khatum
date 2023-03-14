import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/model/response/report/ReportResponse.dart';
import 'package:intl/intl.dart';

import '../controller/transaction_controller.dart';

class CustomListBody extends GetView<TransactionController>{
  final Payload payload;
  const CustomListBody({Key? key, required this.payload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<TransactionController>(
          () => TransactionController(),
    );
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10)
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat.yMMMMEEEEd().format(DateTime.parse(payload.transactionDate!),),style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 10,),
              Text(payload.keywordDescription!,style: const TextStyle(fontSize: 17,color: Colors.black),),
              const SizedBox(height: 10,),
              Text("Transaction ID:"+payload.transactionID!,style: const TextStyle(fontSize: 14),)
            ],
          ),
          Text("${controller.format.format(payload.keywordDescription! == 'Merchant Cash Out' ?payload.amount!.round():payload.amount!.round()+payload.transactionFee!.round())}"+" XCD",style: const TextStyle(fontSize: 17,color: Colors.green),),
        ],
      ),
    );
  }



}