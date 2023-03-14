import 'package:flutter/material.dart';
import 'package:wallet_merchant/model/response/my-message/MyMessageResponse.dart';

class CustomListBody extends StatelessWidget{
  final UserMessageList userMessageList;
  const CustomListBody({Key? key, required this.userMessageList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10)
      ),

      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userMessageList.message!,style: const TextStyle(fontSize: 17,color: Colors.black),),
              const SizedBox(height: 10,),
              Text(userMessageList.date!,style: const TextStyle(fontSize: 14),)
            ],
          ),
    );
  }



}