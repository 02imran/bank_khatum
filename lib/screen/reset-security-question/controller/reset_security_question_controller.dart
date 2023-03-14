import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/model/body/reset-security-question/ResetSecurityQuestionBody.dart';
import 'package:wallet_merchant/model/response/ans-reset-security-question/AnsResetSecurityQuestionResponse.dart';
import 'package:wallet_merchant/model/response/reset-security-question/ResetSecurityQuestionResponse.dart';
import 'package:wallet_merchant/repository/repository.dart';
import 'package:wallet_merchant/screen/common-success/common_success.dart';
import 'package:wallet_merchant/screen/set-pin/set-pin.dart';
import '../../../DialogHelper.dart';
import '../../../global.dart';
import '../../../shared_prefs_helper.dart';
import 'package:wallet_merchant/model/body/set-security-question/SetSecurityQuestionBody.dart' as body;



class ResetSecurityQuestionController extends  GetxController with StateMixin{

  final AppRepository _appRepository=AppRepository();

  var getSecurityQuestionResponseData=ResetSecurityQuestionResponse().obs;
  late TextEditingController pinController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pinController = TextEditingController();

    SharedPrefsHelper.getMsisdn().then((msisdn) =>
    {
      SharedPrefsHelper.getBasicToken().then((token) async {

        DialogHelper.showLoading("Please Wait");

        var body=ResetSecurityQuestionBody(msisdn: msisdn);
        ResetSecurityQuestionResponse  response= await _appRepository.getResetSecurityQuestion(body,token);
        if(response.responseCode! ==100){
          DialogHelper.hideLoading();
          getSecurityQuestionResponseData.value=response;

        }else{
          DialogHelper.hideLoading();
        }

      })
    });

  }








  ansSecurityQuestion(){

    SharedPrefsHelper.getMsisdn().then((msisdn) =>
    {
      SharedPrefsHelper.getBasicToken().then((token) async {

        List<body.SecurityQuestionList> lists = questions.entries.map( (entry) => body.SecurityQuestionList(questionId: entry.value.questionId,answer: entry.value.answer )).toList();
        var apiBody=body.SetSecurityQuestionBody(msisdn: msisdn,securityQuestionList: lists);
        print("Body:::"+apiBody.toJson().toString());

        DialogHelper.showLoading("Please Wait");
        AnsResetSecurityQuestionResponse  response= await _appRepository.ansSecurityQuestionForReset(apiBody,token);
        print("Response::"+response.toJson().toString());
        if(response.responseCode==100){
          pinController.text="";
          DialogHelper.hideLoading();
          Get.to(SetPinScreen(token: response.token!));
        }else{
          pinController.text="";
          DialogHelper.hideLoading();
          Fluttertoast.showToast(
              backgroundColor: Colors.red,
              msg: response.responseDescription!,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM);
        }


      })
    });


  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    pinController.dispose();
  }

}