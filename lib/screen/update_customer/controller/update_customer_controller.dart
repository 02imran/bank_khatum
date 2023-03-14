

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:wallet_merchant/screen/update_customer/update_customer_form_field.dart';

import '../../../DialogHelper.dart';
import '../../../app_and_device_info.dart';
import '../../../constants.dart';
import '../../../model/body/generate-otp-body/GenerateOtpBody.dart';
import '../../../model/body/get_customer_profile/GetCustomerProfileBody.dart';
import '../../../model/body/update_customer_body/update_customer_body.dart';
import '../../../model/body/validate-customer-otp-body/ValidateOtpCustomerBody.dart';
import '../../../model/response/generate-otp-reponse/GenerateOtpResponse.dart';
import '../../../model/response/get_profile_data_response/GetProfileResponseModel.dart';
import '../../../model/response/update_customer_response/update_customer_response.dart';
import '../../../model/response/update_customer_validate/UpdateCustomerValidateOtpResponse.dart';
import '../../../model/response/validate-otp-customer-response/ValidateCustomerOtpResponse.dart';
import '../../../repository/repository.dart';
import '../../../shared_prefs_helper.dart';
import '../../../size_config.dart';
import '../../common-success/common_success.dart';
import '../update_customer_info.dart';

class UpdateCustomerController extends GetxController{

  final GlobalKey<FormState> updateCustomerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> updateCustomerPhoneFormKey = GlobalKey<FormState>();

  late TextEditingController phoneController;
  late TextEditingController newPhoneController;
  var phone = '';

  final AppRepository _appRepository=AppRepository();

  late TextEditingController otpController;

  late TextEditingController firstNameController;
  var firstName = '';

  late TextEditingController lastNameController;
  var lastName = '';

  late TextEditingController documentController;
  var documentNumber = '';

  late TextEditingController emailController;
  var email = '';

  late TextEditingController pinController;



  var selectGender="".obs;
  var genderList=["Male","Female"];
  var selectedGenderValue = "".obs;

  var dobDate = DateTime.now().obs;
  var expierDate = DateTime.now().obs;
  var responseName= ''.obs;
  final Rx<Uint8List> nidFront = Uint8List(0).obs;
  final Rx<Uint8List> nidBack = Uint8List(0).obs;
  var nidFontSide = '';
  var nidBackSide = '';
  var walletType = ''.obs;

  RxList<IdTypeList> idTypeList = <IdTypeList>[].obs;
  RxList<CountryList> countryList = <CountryList>[].obs;
  RxList<CityList> cityList = <CityList>[].obs;
  RxList<DistrictList> districtList = <DistrictList>[].obs;
  RxList<DistrictList> filterDistrictList = <DistrictList>[].obs;


  var chooseIdtype = ''.obs;
  var chooseNationality = ''.obs;
  var chooseCity = CityList().obs;
  var chooseDistrict = DistrictList().obs;
  var chooseValueCity = '';



  cityOnchange(value){

    for(var city in cityList.value){
      if(city.cityId.toString() == value){
        chooseValueCity = city.cityId ?? '';
      }
    }
    filterDistrictList.value.clear();
      RxList<DistrictList> filter = <DistrictList>[].obs;
      for(var district in districtList.value){
        if(district.cityId.toString() == value.toString()){
          filter.add(district);
        }
      }
      filterDistrictList.value = filter.value;
      print('filter list ${filter.value.length}');

  }


  @override
  void onInit() {
    phoneController = TextEditingController();
    otpController = TextEditingController();
    firstNameController= TextEditingController();
    lastNameController= TextEditingController();
    pinController = TextEditingController();
    documentController = TextEditingController();
    emailController = TextEditingController();
    newPhoneController = TextEditingController();
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

  String? validDocumentNumber(String value) {
    if (value.length < 6) {
      return "Document Number is invalid";
    }
    return null;
  }

  String? emailValidate(String value) {
    if (emailController.text.isEmpty) {
      return "Email required";
    }
    return null;
  }

  @override
  void onClose() {
    phoneController.dispose();
    otpController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    documentController.dispose();
    emailController.dispose();
    newPhoneController.dispose();
    super.onClose();
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: dobDate.value,
      firstDate: DateTime(1980),
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

  chooseExpireDate() async {
    DateTime? pickedDate1 = await showDatePicker(
      context: Get.context!,
      initialDate: expierDate.value,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),

      helpText: 'Select',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Expire',
      fieldHintText: 'Year/Month/Date/',
    );
    if (pickedDate1 != null && pickedDate1 != expierDate.value) {
      expierDate.value = pickedDate1;
    }
  }

  getFromCamera() async {
    try {
      PickedFile? pickedFile = await ImagePicker().getImage(
        source: ImageSource.camera,
        maxWidth: 500,
        maxHeight: 500,
      );
      if (pickedFile == null) {
        return;
      }
      nidFontSide = pickedFile.path;
      print('nid path ----------------- ${nidFontSide}');
      final bytes = File(nidFontSide).readAsBytesSync();
      String nidFontImageBase64 = base64Encode(bytes);
      nidFront.value = const Base64Decoder().convert(nidFontImageBase64);

      update();

    }
    catch (e) {
      printInfo(info: e.toString());
    }

  }

  getFromGallery() async {
    try {
      PickedFile? pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxWidth: 500,
        maxHeight: 500,
      );

      if (pickedFile == null) {
        return;
      }
      nidFontSide = pickedFile.path;
      final bytes = File(nidFontSide).readAsBytesSync();
      String nidFontImageBase64 = base64Encode(bytes);
      nidFront.value = const Base64Decoder().convert(nidFontImageBase64);
      update();

    }
    catch (e) {
      printInfo(info: e.toString());
    }

  }

  getFromCamera1() async {
    try {
      PickedFile? pickedFile1 = await ImagePicker().getImage(
        source: ImageSource.camera,
        maxWidth: 500,
        maxHeight: 500,
      );
      if (pickedFile1 == null) {
        return;
      }
      nidBackSide = pickedFile1.path;
      print('nid path ----------------- ${nidBackSide}');
      final bytes1 = File(nidBackSide).readAsBytesSync();
      String nidBackImageBase64 = base64Encode(bytes1);

      nidBack.value = const Base64Decoder().convert(nidBackImageBase64);
      update();

    }
    catch (e) {
      printInfo(info: e.toString());
    }

  }

  getFromGallery1() async {
    try {
      PickedFile? pickedFile1 = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxWidth: 500,
        maxHeight: 500,
      );

      if (pickedFile1 == null) {
        return;
      }
      nidBackSide = pickedFile1.path;
      final bytes1 = File(nidBackSide).readAsBytesSync();
      String nidBackImageBase64 = base64Encode(bytes1);

      nidBack.value = const Base64Decoder().convert(nidBackImageBase64);
      update();

    }
    catch (e) {
      printInfo(info: e.toString());
    }

  }

  confirmUpdateKycCustomer(BuildContext context){
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
                      var kycUpdateBody=KycUpdateBody(
                        customerMsisdn: newPhoneController.text,
                        msisdn: msisdn,
                        dob: dobDate.value.toString().substring(0,10),
                        email: email,
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        gender: selectedGenderValue.value,
                        idExpiryDate: expierDate.value.toString().substring(0, 10),
                        idType: chooseIdtype.value,
                        nationality: chooseNationality.value,
                        permanentCity: chooseValueCity,
                        permanentDistrict: chooseDistrict.value.districtId,
                        pin: pinController.text,
                        idNumber: documentNumber,
                      );
                      print("Body:::::::::"+kycUpdateBody.toJson().toString());
                      DialogHelper.showLoading("Please Wait");
                      UpdateCustomerResponse  response= await _appRepository.updateCustomerKyc(kycUpdateBody,token, nidFontSide, nidBackSide);


                      print("Response::"+response.toJson().toString());
                      if(response.responseCode==100){
                        DialogHelper.hideLoading();
                        Get.to(
                            const CommonSuccess(), arguments: ["Your request has been submitted\nPlease wait for approve from\nAeon Support"]);

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

  updateKycCustomer(BuildContext context) {
    final isValid = updateCustomerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    updateCustomerFormKey.currentState!.save();

    displayPinDialog(context);

  }

  checkUpdateCustomer(BuildContext context) {
    final isValid = updateCustomerPhoneFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    updateCustomerPhoneFormKey.currentState!.save();

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
                      var generateOtpBody=GenerateOtpBody(customerMsisdn: mobilePrefix+phone,msisdn: msisdn,keyword: "AKYC");
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

  getCustomerProfile(BuildContext context) {
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
                      var getCustomerProfileBody = GetCustomerProfileBody(msisdn: msisdn, customerMsisdn: mobilePrefix+phone);
                      // var getCustomerProfileBody = GetCustomerProfileBody(msisdn: msisdn, customerMsisdn: mobilePrefix+'335561277');
                      print("Body::"+getCustomerProfileBody.toJson().toString());
                      DialogHelper.showLoading("Please Wait");
                      GetProfileResponseModel  response= await _appRepository.getCustomerProfile(getCustomerProfileBody,token);
                      print("Response::"+response.toJson().toString());
                      if(response.responseCode==100){
                        DialogHelper.hideLoading();
                        firstNameController.text = response.customerProfile!.firstName.toString();
                        lastNameController.text = response.customerProfile!.lastName.toString();
                        newPhoneController.text = "${response.customerProfile!.msisdn}";
                        dobDate.value =DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.parse(response.customerProfile!.dob.toString()))) ;
                        if(response.customerProfile!.gender.toString() == 'M'){
                          selectGender.value = genderList[0];
                          if(selectGender.value == "Male"){
                            selectedGenderValue.value = "M";
                          }

                        }else{
                          selectGender.value = genderList[1];
                          if(selectGender.value == "Female"){
                            selectedGenderValue.value = "F";
                          }

                        }
                        idTypeList.value = response.formOptionModel!.idTypeList ?? [];
                        countryList.value = response.formOptionModel!.countryList ?? [];
                        cityList.value = response.formOptionModel!.cityList ?? [];
                        districtList.value = response.formOptionModel!.districtList ?? [];
                        walletType.value = response.customerProfile!.walletType ?? '';

                        Get.to(const UpdateCustomerInfo());

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
                              "Update Customer Information",
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
                                validateOtp(context);
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

  validateOtp(BuildContext context){

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
                      UpdateCustomerValidateOtpResponse  response= await _appRepository.updateCustomerValidateCustomerOtp(body,token);
                      print("Response::"+response.toJson().toString());
                      if(response.responseCode==100){
                        DialogHelper.hideLoading();
                        responseName.value = '${response.data!.firstName} ${response.data!.lastName}';
                        getCustomerProfile(context);
                      }else{
                        DialogHelper.hideLoading();
                        // Get.to(const UpdateCustomerFormField());
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

  displayPinDialog(BuildContext context) {
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

                              confirmUpdateKycCustomer(context);

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

}