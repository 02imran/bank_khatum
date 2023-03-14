import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/model/body/aml/AmlBody.dart';
import 'package:wallet_merchant/model/response/aml/AmlResponse.dart';
import 'package:wallet_merchant/repository/repository.dart';
import 'package:wallet_merchant/screen/transaction-overview/transaction_overview_screen.dart';
import 'package:wallet_merchant/size_config.dart';

import '../../../DialogHelper.dart';
import '../../../app_and_device_info.dart';
import '../../../constants.dart';
import '../../../shared_prefs_helper.dart';

class GetPaymentController  extends GetxController with StateMixin{
  final AppRepository _appRepository=AppRepository();
  final GlobalKey<FormState> getPaymentFromKey = GlobalKey<FormState>();
  late TextEditingController amountController;
  var amount = '';

  late TextEditingController referenceController;
  var reference = '';

  late TextEditingController phoneController;
  late TextEditingController pinController;




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    amountController = TextEditingController();
    referenceController = TextEditingController();
    phoneController = TextEditingController();
    pinController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    amountController.dispose();
    referenceController.dispose();
    phoneController.dispose();
    pinController.dispose();
  }

  String? validateAmount(String value) {
    if (value.isEmpty) {
      return "Amount not valid";
    }
    return null;
  }

  String? validateReference(String value) {
    if (value.isEmpty) {
      return "Reference not valid";
    }
    return null;
  }

  checkPayment(BuildContext context){

    final isValid = getPaymentFromKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    getPaymentFromKey.currentState!.save();


    showModalBottomSheet<void>(
        enableDrag: true,
        isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.only(left: 20,right: 10),
        height: MediaQuery.of(context).size.height / 2 +
            MediaQuery.of(context).viewInsets.bottom,
        child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children:   <Widget>[

               SizedBox(height: getProportionateScreenHeight(20),),
               const Text("Enter Customer Details",style: TextStyle(fontSize: 17,color: Colors.black),),
               SizedBox(height: getProportionateScreenHeight(10),),
               TextFormField(
                  controller: phoneController,
                  style: const TextStyle(color: kTextColor, fontSize: 17),
                  autofocus: false,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: const InputDecoration(
                    counterText: "",
                    prefixText: countryCodePrefix,
                    labelText: "Wallet ID (1-xx-xxxxxxxx)",
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
                ),
               SizedBox(height: getProportionateScreenHeight(10),),
               TextFormField(
                 obscureText: true,
                 controller: pinController,
                 style: const TextStyle(color: kTextColor, fontSize: 17),
                 autofocus: false,
                 keyboardType: TextInputType.text,
                 maxLength: 4,
                 decoration: const InputDecoration(
                   counterText: "",
                   labelText: "Enter 4-digits PIN",
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
               ),
               SizedBox(height: getProportionateScreenHeight(16),),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   GestureDetector(
                     onTap: (){
                       phoneController.text="";
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
                       FocusScope.of(context).requestFocus(FocusNode());
                       if(pinController.text.isEmpty){
                         Fluttertoast.showToast(
                             backgroundColor: Colors.red,
                             msg: "Enter Pin",
                             toastLength: Toast.LENGTH_SHORT,
                             gravity: ToastGravity.BOTTOM);
                       }else if(phoneController.text.isEmpty){
                         Fluttertoast.showToast(
                             backgroundColor: Colors.red,
                             msg: "Enter Wallet ID",
                             toastLength: Toast.LENGTH_SHORT,
                             gravity: ToastGravity.BOTTOM);
                       }else{
                         amlRequest(pinController.text, reference);
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
                       child: const Center(child: Center(child:Text("Pay",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
                     ),
                   )
                 ],
               )
              ],

        ),
      );
    });

  }

  amlRequest(String pin,String reference){


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
                      var amlBody=AmlBody(amount: amount,currency: "XCD",customerMsisdn: mobilePrefix+phoneController.text,destinationMsisdn: msisdn,keyword:"PMNT",msisdn: msisdn,pin:pin  );
                      print("Body::"+amlBody.toJson().toString());
                      DialogHelper.showLoading("Please Wait");
                      AmlResponse  response= await _appRepository.getAmlRequest(amlBody,token);
                      print("Response::"+response.toJson().toString());
                      if(response.responseCode==100){
                        pinController.text="";
                        DialogHelper.hideLoading();
                        Get.to( TransactionOverviewScreen(),arguments: [response,pin,reference,response.keyword,"","",""]);
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