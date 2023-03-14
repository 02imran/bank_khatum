import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wallet_merchant/model/body/app-login/AppLoginBody.dart';
import 'package:wallet_merchant/model/body/report/ReportBody.dart';
import 'package:wallet_merchant/model/response/report/ReportResponse.dart';
import 'package:wallet_merchant/repository/repository.dart';
import 'package:wallet_merchant/model/response/app-login/AppLoginResponse.dart';
import 'package:wallet_merchant/screen/refund-overview/refund_overview_screen.dart';

import '../../../DialogHelper.dart';
import '../../../app_and_device_info.dart';
import '../../../constants.dart';
import '../../../model/body/check-refund-body/CheckRefundBody.dart';
import '../../../model/response/check-refund/CheckRefundResponse.dart';
import '../../../shared_prefs_helper.dart';
import '../../../size_config.dart';
class TransactionController extends GetxController with StateMixin{

  var selectedStartDate = DateTime.now().obs;

  var selectedEndDate = DateTime.now().obs;

  final AppRepository _appRepository=AppRepository();

  var reportResponseData=ReportResponse(issuccess: false).obs;

  late TextEditingController pinController;

  final format = NumberFormat("#,###");

  @override
  void onInit() {
    super.onInit();
    pinController = TextEditingController();

  }

  @override
  void onClose() {

    pinController.dispose();

  }



  getTransactionHistory(){

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
                      var appLoginBody=AppLoginBody(phoneOs: os,phoneBrand: phoneBrand,msisdn: msisdn,deviceId: deviceId );
                      print("Body::"+appLoginBody.toJson().toString());
                      DialogHelper.showLoading("Please Wait");
                      AppLoginResponse  response= await _appRepository.getAppLogin(appLoginBody);
                      print("Response::"+response.toJson().toString());
                      if(response.issuccess!){

                        var reportBody=ReportBody(msisdn: msisdn,fromDate: startDate(),page: "1",pageSize: "100",pin: "",toDate: enDate());
                        print("Body::"+reportBody.toJson().toString());
                        ReportResponse  reportResponse= await _appRepository.getReport(reportBody,response.payload!.token!);
                        print("Response::"+reportResponse.toJson().toString());

                        if(reportResponse.issuccess!){
                          DialogHelper.hideLoading();
                          reportResponseData.value=reportResponse;
                        }else{
                          DialogHelper.hideLoading();
                        }


                      }else{
                        DialogHelper.hideLoading();

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







  displayDialog(BuildContext context,String transactionId) {
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
                            "Refund",
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
                            "Enter your 4 digit  PIN in order to confirm your transaction",
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
                              checkRefund(transactionId,pinController.text);

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






  checkRefund(String transactionId,String pin){

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
                      var checkRefundBody=CheckRefundBody(keyword:"FRFD",msisdn: msisdn,pin:pinController.text,appVersion: appVersion,fullName: fullName,osVersion: osVersion,phoneOs: os,phoneBrand: phoneBrand,transactionId: transactionId  );
                      print("Body::"+checkRefundBody.toJson().toString());
                      DialogHelper.showLoading("Please Wait");
                      CheckRefundResponse  response= await _appRepository.checkRefundApi(checkRefundBody,token);
                      print("Response::"+response.toJson().toString());
                      if(response.responseCode==100){
                        pinController.text="";
                        DialogHelper.hideLoading();
                        Get.to(const RefundOverViewScreen(),arguments: [response]);
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


  String startDate(){
    final fd=selectedStartDate.value.year.toString()+"-"+selectedStartDate.value.month.toString()+"-"+selectedStartDate.value.day.toString();
    return fd;
  }

  String enDate(){
    final fd=selectedEndDate.value.year.toString()+"-"+selectedEndDate.value.month.toString()+"-"+selectedEndDate.value.day.toString();
    return fd;
  }

}