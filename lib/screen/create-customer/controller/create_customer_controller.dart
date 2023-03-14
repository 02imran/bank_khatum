import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wallet_merchant/model/body/create-Customer/CreateCustomerBody.dart';

import '../../../DialogHelper.dart';
import '../../../app_and_device_info.dart';
import '../../../constants.dart';
import '../../../model/body/generate-otp-body/GenerateOtpBody.dart';
import '../../../model/body/validate-customer-otp-body/ValidateOtpCustomerBody.dart';
import '../../../model/response/create-customer/CustomerRegistrationResponseModel.dart';
import '../../../model/response/generate-otp-reponse/GenerateOtpResponse.dart';
import '../../../model/response/validate-otp-customer-response/ValidateCustomerOtpResponse.dart';
import '../../../repository/repository.dart';
import '../../../shared_prefs_helper.dart';
import '../../../size_config.dart';
import '../../common-success/common_success.dart';
import '../component/success.dart';
import '../create_customer_form.dart';

class CreateCustomerController extends GetxController with StateMixin {

  final GlobalKey<FormState> createCustomerFromKey = GlobalKey<FormState>();

  final GlobalKey<FormState> createCustomerSubmitFromKey = GlobalKey<FormState>();


  late TextEditingController phoneController;
  var phone = '';

  final AppRepository _appRepository=AppRepository();

  late TextEditingController otpController;

  late TextEditingController firstNameController;
  var firstName = '';

  late TextEditingController lastNameController;
  var lastName = '';

  late TextEditingController pinController;
  var pinText = '';


  var selectGender="Male".obs;
  var genderList=["Male","Female"];

  var dobDate = DateTime.now().obs;

  @override
  void onInit() {
    phoneController = TextEditingController();
    otpController = TextEditingController();
    firstNameController= TextEditingController();
    lastNameController= TextEditingController();
    pinController = TextEditingController();
    super.onInit();
  }

  String? validatePhone(String value) {
    if (value.length < 8) {
      return "Phone number  not valid";
    }
    return null;
  }

  String? validateFirstName(String value) {
    if (value.length < 2) {
      return "First Name not valid";
    }
    return null;
  }

  String? validateLastName(String value) {
    if (value.length < 2) {
      return "Last Name not valid";
    }
    return null;
  }

  @override
  void onClose() {
    phoneController.dispose();
    otpController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.onClose();
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: dobDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime(2024),

      helpText: 'Select',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'DOB',
      fieldHintText: 'Month/Date/Year',
    );
    if (pickedDate != null && pickedDate != dobDate.value) {
      dobDate.value = pickedDate;
    }
  }

  registrationCustomer(){
    getAppVersion().then((appVersion) => {
      getDeviceId().then((deviceId) => {
        getFlag().then((flag) => {
          getFullName().then((fullName) => {
            getOsVersion().then((osVersion) => {
              getPhoneBrand().then((phoneBrand) => {
                SharedPrefsHelper.getMsisdn().then((msisdn) => {
                  SharedPrefsHelper.getBasicToken().then((token) => {
                    getOs().then((os)  async {
                      var sGender;
                      if(selectGender.value == 'Male'){
                        sGender = 'M';
                      }
                      else{
                        sGender = 'F';
                      }
                      if (kDebugMode) {
                        print("App Version:"+appVersion+","+"Device Id:"+deviceId+","+"flag:"+flag+","+"FullName:"+"$firstName $lastName"+","+"Os Version:"+osVersion!+","+"phone Brand:"+phoneBrand!+","+"Os:"+os!);
                      }

                      var createCustomerBody=CreateCustomerBody(msisdn: msisdn, messageBody: 'REGC ${mobilePrefix+phone} $firstName $lastName $sGender ${DateFormat("yyyy-MM-dd").format(dobDate.value)} ${pinController.text}');
                      print("Body::"+createCustomerBody.toJson().toString());
                      DialogHelper.showLoading("Please Wait");
                      CustomerRegistrationResponseModel  response= await _appRepository.customerRegistration(createCustomerBody,token);
                      print("Response::"+response.toJson().toString());
                      if(response.responseCode==100 ){
                        DialogHelper.hideLoading();
                        if(!(response.responseDescription)!.contains("wrong PIN")){
                          pinController.text="";
                          DialogHelper.hideLoading();
                          if(response.transactionId.toString().length > 5){
                            Get.to(
                                const Success(), arguments: [response.responseDescription]);
                          }else{
                            Fluttertoast.showToast(
                                backgroundColor: Colors.red,
                                msg: 'Registration Failed',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM);
                          }


                        }else{
                          Fluttertoast.showToast(
                              backgroundColor: Colors.red,
                              msg: response.responseDescription!,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM);
                        }


                      }else{
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

  confirmCustomerRegistration(BuildContext context) {
    final isValid = createCustomerSubmitFromKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    createCustomerSubmitFromKey.currentState!.save();

    _displayPinDialog(context);
  }


  checkCreateCustomer(BuildContext context) {
    final isValid = createCustomerFromKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    createCustomerFromKey.currentState!.save();

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
                      var generateOtpBody=GenerateOtpBody(customerMsisdn: mobilePrefix+phone,msisdn: msisdn,keyword: "REGC");
                      print("Body::"+generateOtpBody.toJson().toString());
                      DialogHelper.showLoading("Please Wait");
                      GenerateOtpResponse  response= await _appRepository.generateOtp(generateOtpBody,token);
                      print("Response::"+response.toJson().toString());
                      if(response.responseCode==100){
                        DialogHelper.hideLoading();
                        _displayDialog(context);
                      }else{
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

  resendOtp(){

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
                      var generateOtpBody=GenerateOtpBody(customerMsisdn: mobilePrefix+phone,msisdn: msisdn,keyword: "REGC");
                      print("Body::"+generateOtpBody.toJson().toString());
                      DialogHelper.showLoading("Please Wait");
                      GenerateOtpResponse  response= await _appRepository.generateOtp(generateOtpBody,token);
                      print("Response::"+response.toJson().toString());
                      if(response.responseCode==100){
                        DialogHelper.hideLoading();
                      }else{
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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
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
                              "Customer Registration",
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
                              "Enter the six digit OTP code that was sent to the register customer mobile number",
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
                            controller: otpController,
                            style: const TextStyle(color: kTextColor, fontSize: 25,letterSpacing: 35.0),
                            autofocus: true,
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: false, decimal: false),
                            maxLength: 6,
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

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              if(otpController.text.length==6){
                                Navigator.of(context).pop();
                                FocusScope.of(context).requestFocus(FocusNode());
                                validateOtp();
                              }else{
                                Fluttertoast.showToast(
                                    msg: "Pin must be 6 digit",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM);
                              }

                            },
                            child: Container(
                              width: getProportionateScreenWidth(300),
                              height: getProportionateScreenHeight(50),
                              margin: const EdgeInsets.only(left: 5,right: 5),
                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: kColorPrimary
                              ),
                              child: const Center(child: Center(child:Text("Verify",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
                            ),
                          ),
                          const SizedBox(height: 15,),
                          GestureDetector(
                            onTap: (){
                              resendOtp();
                            },
                            child: Container(
                              width: getProportionateScreenWidth(300),
                              height: getProportionateScreenHeight(50),
                              margin: const EdgeInsets.only(left: 5,right: 5),
                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: colorOrange
                              ),
                              child: const Center(child: Center(child:Text("Resend Otp",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),),),
                            ),
                          ),

                        ],
                      )

                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }


  _displayPinDialog(BuildContext context) {
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
                            "Create Agent",
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

                              registrationCustomer();

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


  validateOtp(){

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
                      var body=ValidateOtpCustomerBody(customerMsisdn: mobilePrefix+phone,msisdn: msisdn,plainOtp: otpController.text);
                      print("Body::"+body.toJson().toString());
                      DialogHelper.showLoading("Please Wait");
                      ValidateCustomerOtpResponse  response= await _appRepository.validateCustomerOtp(body,token);
                      print("Response::"+response.toJson().toString());
                      if(response.responseCode==100){
                        DialogHelper.hideLoading();
                        Get.to(const CreateCustomerForm());
                      }else{
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