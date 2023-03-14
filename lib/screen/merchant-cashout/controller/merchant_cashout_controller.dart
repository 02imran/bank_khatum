import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/constants.dart';
import 'package:wallet_merchant/model/body/aml/AmlBody.dart';
import 'package:wallet_merchant/model/response/aml/AmlResponse.dart';
import 'package:wallet_merchant/repository/repository.dart';
import 'package:wallet_merchant/screen/otp/otp_screen.dart';
import 'package:wallet_merchant/screen/transaction-overview/transaction_overview_screen.dart';
import 'package:wallet_merchant/size_config.dart';

import '../../../DialogHelper.dart';
import '../../../app_and_device_info.dart';
import '../../../shared_prefs_helper.dart';

class MerchantCashOutController extends GetxController with StateMixin {
  final GlobalKey<FormState> cashOutFromKey = GlobalKey<FormState>();

  late TextEditingController phoneController;
  var phone = '';

  late TextEditingController amountController;
  var amount = '';

  late TextEditingController pinController;
  final AppRepository _appRepository=AppRepository();

  @override
  void onInit() {
    super.onInit();

    phoneController = TextEditingController();
    amountController = TextEditingController();
    pinController = TextEditingController();
  }

  @override
  void onClose() {
    phoneController.dispose();
    amountController.dispose();
    pinController.dispose();
  }

  String? validatePhone(String value) {
    if (value.length < 4) {
      return "Phone number or agent code not valid";
    }
    return null;
  }

  String? validateAmount(String value) {
    if (value.isEmpty) {
      return "Amount not valid";
    }
    return null;
  }

  checkCashOut(BuildContext context) {
    final isValid = cashOutFromKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    cashOutFromKey.currentState!.save();
    _displayDialog(context);
  }

  _displayDialog(BuildContext context) {
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
                        "Merchant Cash Out",
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
                        "Enter your 4 digit Merchant PIN in order to confirm your transaction",
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

                          amlRequest(pinController.text);

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

  amlRequest(String pin){


    getAppVersion().then((appVersion) => {
      getDeviceId().then((deviceId) => {
        getFlag().then((flag) => {
          getFullName().then((fullName) => {
            getOsVersion().then((osVersion) => {
              getPhoneBrand().then((phoneBrand) => {
                SharedPrefsHelper.getMsisdn().then((msisdn) => {
                  SharedPrefsHelper.getBasicToken().then((token) => {
                    getOs().then((os)  async {
                      if (kDebugMode) {
                        print("App Version:"+appVersion+","+"Device Id:"+deviceId+","+"flag:"+flag+","+"FullName:"+fullName!+","+"Os Version:"+osVersion!+","+"phone Brand:"+phoneBrand!+","+"Os:"+os!);
                      }
                      var amlBody=AmlBody(amount: amount.replaceAll(",", ""),currency: "KHR",customerMsisdn: "",destinationMsisdn:  phone,keyword:"MGIV",msisdn: msisdn,pin:pinController.text  );
                      print("Body::"+amlBody.toJson().toString());
                      DialogHelper.showLoading("Please Wait");
                      AmlResponse  response= await _appRepository.getAmlRequest(amlBody,token);
                      print("Response::"+response.toJson().toString());
                      if(response.responseCode==100){
                        pinController.text="";
                        DialogHelper.hideLoading();
                        Get.to( TransactionOverviewScreen(),arguments: [response,pin,"",response.keyword,"","",""]);

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
                  })
                })
              })
            })
          })
        })
      })
    });


  }
}
