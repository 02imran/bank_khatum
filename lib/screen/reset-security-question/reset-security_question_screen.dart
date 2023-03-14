import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/model/response/reset-security-question/ResetSecurityQuestionResponse.dart';
import 'package:wallet_merchant/size_config.dart';
import '../../constants.dart';
import '../../global.dart';
import 'component/custom_list_body.dart';
import 'controller/reset_security_question_controller.dart';

class ResetSecurityQuestionScreen extends GetView<ResetSecurityQuestionController>{
  const ResetSecurityQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ResetSecurityQuestionController>(
          () => ResetSecurityQuestionController(),
    );
    questions.clear();
    return Scaffold(

      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        title: const Text("Security Question"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [

            const SizedBox(height: 15,),

               const Text("Please answer  the following security question's\n  To reset Your PIN. The answers are\n case sensitive",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                Obx(() =>
                Container(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  width: SizeConfig.screenWidth,
                  child: controller.getSecurityQuestionResponseData.value.securityQuestionList!=null? buildList(controller.getSecurityQuestionResponseData.value.securityQuestionList):Container(),
                ),
              ),

            const SizedBox(height: 20,),

            GestureDetector(
              onTap: (){

                if(questions.length==controller.getSecurityQuestionResponseData.value.securityQuestionList!.length){
                  controller.ansSecurityQuestion();
                }else{
                  Fluttertoast.showToast(
                      msg: "Please answer all the question",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM);
                }



              },
              child: Container(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                margin: const EdgeInsets.only(left: 50,right: 50),
                decoration:  BoxDecoration(
                  color: kButtonColor,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: const Center(
                  child: Text("Submit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
                ),
              ),
            )

          ],
        ),
      ),



    );
  }


  Widget buildList(List<SecurityQuestionList>? securityQuestionList) {
    return  Column(
      children: [
        ...List.generate(securityQuestionList!.length, (index) {
          return Container(
            margin: const EdgeInsets.only(top: 5),
            child: CustomListBody(securityQuestionList: securityQuestionList[index], index: index,),

          );
        }),
      ],

    );
  }



}