import 'package:flutter/material.dart';
import 'package:wallet_merchant/global.dart';
import 'package:wallet_merchant/model/body/set-security-question/SetSecurityQuestionBody.dart' as body;
import 'package:wallet_merchant/model/response/get-security-question/GetSecurityQuestionResponse.dart';

import '../../../constants.dart';

class CustomListBody extends StatelessWidget{
  final SecurityQuestionList? securityQuestionList;
  final int index;
  const CustomListBody({Key? key, required this.securityQuestionList,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 5),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              TextField(

                keyboardType: TextInputType.text,
                onChanged: (text) {
                  questions[index]=body.SecurityQuestionList(answer: text,questionId: securityQuestionList!.questionId);

                },
                decoration:  InputDecoration(
                  labelText: securityQuestionList!.question,
                  labelStyle: const TextStyle(color: kTextColor),
                  contentPadding: const EdgeInsets.fromLTRB(0, 15, 15, 0),
                  enabledBorder: const UnderlineInputBorder(),
                  border: const UnderlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid,color: kColorPrimary)),
                  focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid,color: kColorPrimary)),
                  errorBorder: const UnderlineInputBorder(borderSide: BorderSide(
                    color: Colors.red,
                  ),),
                  focusedErrorBorder: const UnderlineInputBorder(borderSide: BorderSide(
                    color: Colors.red,
                  ),),
                ),
              ),
            ],
          ),
    );
  }



}