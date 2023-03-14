import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/model/body/get-security-question/GetSecurityQuestionBody.dart';
import 'package:wallet_merchant/model/response/get-security-question/GetSecurityQuestionResponse.dart';
import 'package:wallet_merchant/model/response/set-security-question/SetSecurityQuestionResponse.dart';
import 'package:wallet_merchant/repository/repository.dart';
import 'package:wallet_merchant/screen/common-success/common_success.dart';
import '../../../DialogHelper.dart';
import '../../../constants.dart';
import '../../../global.dart';
import '../../../shared_prefs_helper.dart';
import 'package:wallet_merchant/model/body/set-security-question/SetSecurityQuestionBody.dart' as body;

import '../../../size_config.dart';


class SecurityQuestionController extends  GetxController with StateMixin{

  final AppRepository _appRepository=AppRepository();

  var getSecurityQuestionResponseData=GetSecurityQuestionResponse().obs;
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

        var body=GetSecurityQuestionBody(msisdn: msisdn);
        GetSecurityQuestionResponse  response= await _appRepository.getSecurityQuestion(body,token);
        if(response.responseCode! ==100){
          DialogHelper.hideLoading();
          getSecurityQuestionResponseData.value=response;

        }else{
          DialogHelper.hideLoading();
        }

      })
    });

  }




  displayDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
            body:SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      color: kColorPrimary,
                      width: SizeConfig.screenWidth,
                      height: getProportionateScreenHeight(55),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Security Question",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontSize: 17),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(40),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: const Center(
                        child: Text(
                            "Enter your 4 digit Agent PIN in order to confirm your transaction",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal)),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(70),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: TextFormField(
                          obscureText: true,
                          textAlign: TextAlign.center,
                          controller: pinController,
                          style: const TextStyle(color: kTextColor, fontSize: 25,letterSpacing: 40.0),
                          autofocus: true,
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: false, decimal: false),
                          maxLength: 4,
                          decoration: const InputDecoration(
                            counterText: "",
                            labelText: "",
                            labelStyle: TextStyle(color: kTextColor),
                            contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 0),
                            enabledBorder: UnderlineInputBorder(),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    style: BorderStyle.solid, color: kColorPrimary)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    style: BorderStyle.solid, color: kColorPrimary)),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        )
                    ),

                    SizedBox(
                      height: getProportionateScreenHeight(60),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (){
                            pinController.text="";

                          },
                          child: Container(
                            width: getProportionateScreenWidth(140),
                            height: getProportionateScreenHeight(50),
                            margin: const EdgeInsets.only(left: 5,right: 5),
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: colorOrange
                            ),
                            child: const Center(child: Center(child:Text("Clear",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            if(pinController.text.length==4){
                              print("Output::"+pinController.text);
                              Navigator.of(context).pop();
                              FocusScope.of(context).requestFocus(FocusNode());

                              setSecurityQuestion(pinController.text);

                            }else{
                              Fluttertoast.showToast(
                                  msg: "Pin must be 4 digit",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM);
                            }

                          },
                          child: Container(
                            width: getProportionateScreenWidth(140),
                            height: getProportionateScreenHeight(50),
                            margin: const EdgeInsets.only(left: 5,right: 5),
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: kButtonColor
                            ),
                            child: const Center(child: Center(child:Text("Confirm",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
                          ),
                        )
                      ],
                    )

                  ],
                ),
              ),
            ));
      },
    );
  }



  setSecurityQuestion(String pin){

    SharedPrefsHelper.getMsisdn().then((msisdn) =>
    {
      SharedPrefsHelper.getBasicToken().then((token) async {

        List<body.SecurityQuestionList> lists = questions.entries.map( (entry) => body.SecurityQuestionList(questionId: entry.value.questionId,answer: entry.value.answer )).toList();
        var apiBody=body.SetSecurityQuestionBody(msisdn: msisdn,pin: pin,securityQuestionList: lists);
        print("Body:::"+apiBody.toJson().toString());

        DialogHelper.showLoading("Please Wait");
        SetSecurityQuestionResponse  response= await _appRepository.setSecurityQuestionAns(apiBody,token);
        print("Response::"+response.toJson().toString());
        if(response.responseCode==100){
          pinController.text="";
          DialogHelper.hideLoading();
          Get.to(const CommonSuccess(),arguments: ["Security Question Set Successfully"]);
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